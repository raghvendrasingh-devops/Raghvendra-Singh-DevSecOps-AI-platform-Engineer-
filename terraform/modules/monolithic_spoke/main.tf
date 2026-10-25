# ---------------------------------------------------------------------------------------------------------------------
# MONOLITHIC 3-TIER ENTERPRISE LANDING ZONE MODULE
# Architecture:
# - Spoke VNet with bidirectional Hub Peering
# - Tier 1: Web Tier Subnet (Application Gateway / VMSS)
# - Tier 2: Application Tier Subnet (Internal LB + Business Logic VMs)
# - Tier 3: Data Tier Subnet (Private Endpoints for Azure SQL & Key Vault)
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

# 1. Monolith Spoke VNet
resource "azurerm_virtual_network" "spoke_vnet" {
  name                = var.spoke_vnet_name
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = [var.spoke_address_space]
  tags                = var.tags
}

# 2. VNet Peering: Spoke -> Hub
resource "azurerm_virtual_network_peering" "spoke_to_hub" {
  name                         = "peer-spoke-to-hub"
  resource_group_name          = var.resource_group_name
  virtual_network_name         = azurerm_virtual_network.spoke_vnet.name
  remote_virtual_network_id    = var.hub_vnet_id
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
  use_remote_gateways          = false
}

# 3. Subnets
resource "azurerm_subnet" "web_subnet" {
  name                 = "snet-tier1-web"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.spoke_vnet.name
  address_prefixes     = [var.web_subnet_prefix]
}

resource "azurerm_subnet" "app_subnet" {
  name                 = "snet-tier2-app"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.spoke_vnet.name
  address_prefixes     = [var.app_subnet_prefix]
}

resource "azurerm_subnet" "data_subnet" {
  name                 = "snet-tier3-data"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.spoke_vnet.name
  address_prefixes     = [var.data_subnet_prefix]
}

# 4. Route Table Association (Force Egress to Hub Azure Firewall)
resource "azurerm_subnet_route_table_association" "app_rt_assoc" {
  subnet_id      = azurerm_subnet.app_subnet.id
  route_table_id = var.hub_route_table_id
}

# 5. Network Security Group: Tier 3 Data Isolation (Deny all except from App Tier)
resource "azurerm_network_security_group" "data_nsg" {
  name                = "nsg-tier3-database"
  location            = var.location
  resource_group_name = var.resource_group_name

  security_rule {
    name                       = "Allow-AppTier-SQL"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "1433"
    source_address_prefix      = var.app_subnet_prefix
    destination_address_prefix = var.data_subnet_prefix
  }

  security_rule {
    name                       = "Deny-All-Other-Inbound"
    priority                   = 4096
    direction                  = "Inbound"
    access                     = "Deny"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  tags = var.tags
}

resource "azurerm_subnet_network_security_group_association" "data_nsg_assoc" {
  subnet_id                 = azurerm_subnet.data_subnet.id
  network_security_group_id = azurerm_network_security_group.data_nsg.id
}

# 6. Azure Key Vault (Zero Trust Secrets Management)
resource "azurerm_key_vault" "app_kv" {
  name                        = var.key_vault_name
  location                    = var.location
  resource_group_name         = var.resource_group_name
  enabled_for_disk_encryption = true
  tenant_id                   = var.tenant_id
  soft_delete_retention_days  = 90
  purge_protection_enabled    = true
  sku_name                    = "standard"

  public_network_access_enabled = false # Zero Public Exposure

  network_acls {
    bypass         = "AzureServices"
    default_action = "Deny"
  }

  tags = var.tags
}

# 7. Azure SQL Database (With Private Endpoint)
resource "azurerm_mssql_server" "sql_server" {
  name                         = var.sql_server_name
  resource_group_name          = var.resource_group_name
  location                     = var.location
  version                      = "12.0"
  administrator_login          = "sqladminuser"
  administrator_login_password = var.sql_admin_password
  minimum_tls_version          = "1.2"
  public_network_access_enabled = false # Strictly Private

  tags = var.tags
}

resource "azurerm_mssql_database" "sql_db" {
  name         = "sqldb-enterprise-monolith"
  server_id    = azurerm_mssql_server.sql_server.id
  collation    = "SQL_Latin1_General_CP1_CI_AS"
  max_size_gb  = 50
  sku_name     = "S1"
  enclave_type = "VBS"

  tags = var.tags
}

# 8. Private Endpoint for Azure SQL Server
resource "azurerm_private_endpoint" "sql_private_endpoint" {
  name                = "pe-sql-monolith"
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = azurerm_subnet.data_subnet.id

  private_service_connection {
    name                           = "psc-sql-monolith"
    private_connection_resource_id = azurerm_mssql_server.sql_server.id
    subresource_names              = ["sqlServer"]
    is_manual_connection           = false
  }

  tags = var.tags
}
