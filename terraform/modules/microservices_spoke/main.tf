# ---------------------------------------------------------------------------------------------------------------------
# CLOUD-NATIVE MICROSERVICES LANDING ZONE (AKS + ACR + ZERO-TRUST MESH)
# Architecture:
# - Spoke VNet with Hub Peering
# - Private AKS Cluster (No public API endpoint)
# - Azure CNI Network Model + Calico / Azure Network Policies
# - Azure Key Vault Secrets Store CSI Driver integration
# - Azure Container Registry (ACR) Premium with AcrPull RBAC
# - Centralized Container Insights (OMS Log Analytics)
# ---------------------------------------------------------------------------------------------------------------------

terraform {
  required_version = ">= 1.5.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.90"
    }
  }
}

# 1. Microservices Spoke VNet
resource "azurerm_virtual_network" "aks_vnet" {
  name                = var.aks_vnet_name
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = [var.aks_address_space]
  tags                = var.tags
}

# 2. VNet Peering to Hub
resource "azurerm_virtual_network_peering" "aks_to_hub" {
  name                         = "peer-aks-to-hub"
  resource_group_name          = var.resource_group_name
  virtual_network_name         = azurerm_virtual_network.aks_vnet.name
  remote_virtual_network_id    = var.hub_vnet_id
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
}

# 3. Dedicated Subnets
resource "azurerm_subnet" "aks_system_subnet" {
  name                 = "snet-aks-system-nodes"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.aks_vnet.name
  address_prefixes     = [var.aks_nodes_subnet_prefix]
}

resource "azurerm_subnet" "ingress_subnet" {
  name                 = "snet-aks-ingress-appgw"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.aks_vnet.name
  address_prefixes     = [var.ingress_subnet_prefix]
}

# 4. Association with Hub Route Table (Forcing egress via Hub Firewall)
resource "azurerm_subnet_route_table_association" "aks_rt_assoc" {
  subnet_id      = azurerm_subnet.aks_system_subnet.id
  route_table_id = var.hub_route_table_id
}

# 5. Azure Container Registry (ACR) Premium with Private Link
resource "azurerm_container_registry" "acr" {
  name                = var.acr_name
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = "Premium"
  admin_enabled       = false # Strict RBAC Only
  data_endpoint_enabled = true
  public_network_access_enabled = false # Zero Public Exposure

  retention_policy {
    days    = 30
    enabled = true
  }

  trust_policy {
    enabled = true # Docker Content Trust (Image Signature Verification)
  }

  tags = var.tags
}

# 6. User-Assigned Managed Identity for AKS Control Plane
resource "azurerm_user_assigned_identity" "aks_identity" {
  name                = "id-aks-controlplane-prod"
  resource_group_name = var.resource_group_name
  location            = var.location
  tags                = var.tags
}

# 7. Log Analytics Workspace for Container Insights
resource "azurerm_log_analytics_workspace" "aks_logs" {
  name                = "law-aks-monitoring-prod"
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "PerGB2018"
  retention_in_days   = 30
  tags                = var.tags
}

# 8. Production-Grade Private Azure Kubernetes Service (AKS)
resource "azurerm_kubernetes_cluster" "aks_cluster" {
  name                    = var.aks_cluster_name
  location                = var.location
  resource_group_name     = var.resource_group_name
  dns_prefix_private_cluster = "aks-prod-internal"
  private_cluster_enabled = true # Private Cluster: API server has NO public IP
  sku_tier                = "Standard" # Financially backed 99.95% SLA

  default_node_pool {
    name                = "syspool"
    node_count          = 3
    vm_size             = "Standard_D4s_v5"
    vnet_subnet_id      = azurerm_subnet.aks_system_subnet.id
    enable_auto_scaling = true
    min_count           = 3
    max_count           = 6
    os_disk_size_gb     = 128
    os_disk_type        = "Managed"
    os_sku              = "Ubuntu"
    zones               = ["1", "2", "3"] # Multi-AZ High Availability

    upgrade_settings {
      max_surge = "33%"
    }

    node_labels = {
      "tier" = "system"
    }
  }

  identity {
    type         = "UserAssigned"
    identity_ids = [azurerm_user_assigned_identity.aks_identity.id]
  }

  network_profile {
    network_plugin    = "azure"
    network_policy    = "azure"
    load_balancer_sku = "standard"
    outbound_type     = "userDefinedRouting" # Sends egress traffic to Hub Firewall
  }

  oms_agent {
    log_analytics_workspace_id = azurerm_log_analytics_workspace.aks_logs.id
  }

  key_vault_secrets_provider {
    secret_rotation_enabled  = true
    secret_rotation_interval = "2m"
  }

  azure_active_directory_role_based_access_control {
    managed                = true
    azure_rbac_enabled     = true
    admin_group_object_ids = [var.aad_admin_group_id]
  }

  tags = var.tags
}

# 9. Role Assignment: AKS pulls images from ACR
resource "azurerm_role_assignment" "aks_acr_pull" {
  principal_id                     = azurerm_kubernetes_cluster.aks_cluster.kubelet_identity[0].object_id
  role_definition_name             = "AcrPull"
  scope                            = azurerm_container_registry.acr.id
  skip_service_principal_aad_check = true
}
