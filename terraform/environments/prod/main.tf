# ---------------------------------------------------------------------------------------------------------------------
# PRODUCTION ENTERPRISE LANDING ZONE - ROOT ORCHESTRATOR
# Integrates:
# 1. Central Hub Networking (Azure Firewall Premium + Gateways)
# 2. Monolithic 3-Tier Enterprise Spoke
# 3. Cloud-Native Microservices (AKS + ACR) Spoke
# 4. Zero-Trust Policy Guardrails
# ---------------------------------------------------------------------------------------------------------------------

# 1. Resource Groups
resource "azurerm_resource_group" "rg_hub" {
  name     = "rg-hub-networking-prod"
  location = var.location
  tags     = var.tags
}

resource "azurerm_resource_group" "rg_monolith" {
  name     = "rg-spoke-monolith-prod"
  location = var.location
  tags     = var.tags
}

resource "azurerm_resource_group" "rg_microservices" {
  name     = "rg-spoke-microservices-prod"
  location = var.location
  tags     = var.tags
}

# 2. Central Hub Networking Module
module "hub" {
  source              = "../../modules/hub_networking"
  resource_group_name = azurerm_resource_group.rg_hub.name
  location            = var.location
  hub_vnet_name       = "vnet-hub-prod-001"
  hub_address_space   = "172.16.0.0/20"
  tags                = var.tags
}

# 3. Monolithic 3-Tier Spoke Module
module "monolith" {
  source              = "../../modules/monolithic_spoke"
  resource_group_name = azurerm_resource_group.rg_monolith.name
  location            = var.location
  spoke_vnet_name     = "vnet-spoke-monolith-prod"
  spoke_address_space = "172.16.16.0/20"
  hub_vnet_id         = module.hub.hub_vnet_id
  hub_route_table_id  = module.hub.route_table_id
  tenant_id           = var.tenant_id
  sql_admin_password  = var.sql_admin_password
  tags                = var.tags
}

# 4. Microservices (AKS + ACR) Spoke Module
module "microservices" {
  source              = "../../modules/microservices_spoke"
  resource_group_name = azurerm_resource_group.rg_microservices.name
  location            = var.location
  aks_vnet_name       = "vnet-spoke-microservices-prod"
  aks_address_space   = "172.16.32.0/20"
  hub_vnet_id         = module.hub.hub_vnet_id
  hub_route_table_id  = module.hub.route_table_id
  aad_admin_group_id  = var.aad_admin_group_id
  tags                = var.tags
}

# 5. Governance Policy Guardrails
module "governance" {
  source                   = "../../modules/governance_policies"
  target_resource_group_id = azurerm_resource_group.rg_monolith.id
}
