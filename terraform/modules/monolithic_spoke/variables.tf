variable "resource_group_name" {
  type        = string
  description = "Resource group for Monolith Spoke"
}

variable "location" {
  type        = string
  description = "Azure Region"
}

variable "spoke_vnet_name" {
  type        = string
  default     = "vnet-spoke-monolith-prod"
}

variable "spoke_address_space" {
  type        = string
  default     = "172.16.16.0/20"
}

variable "web_subnet_prefix" {
  type        = string
  default     = "172.16.16.0/24"
}

variable "app_subnet_prefix" {
  type        = string
  default     = "172.16.17.0/24"
}

variable "data_subnet_prefix" {
  type        = string
  default     = "172.16.18.0/24"
}

variable "hub_vnet_id" {
  type        = string
  description = "The ID of the Hub VNet for peering"
}

variable "hub_route_table_id" {
  type        = string
  description = "Hub Route Table ID for forcing egress"
}

variable "tenant_id" {
  type        = string
  description = "Azure Active Directory Tenant ID"
}

variable "key_vault_name" {
  type        = string
  default     = "kv-monolith-sec-01"
}

variable "sql_server_name" {
  type        = string
  default     = "sql-monolith-enterprise-01"
}

variable "sql_admin_password" {
  type        = string
  sensitive   = true
  description = "Administrator password for Azure SQL Server"
}

variable "tags" {
  type        = map(string)
  default     = {
    Environment = "Production"
    Tier        = "Monolith-3-Tier"
    ManagedBy   = "Terraform"
  }
}
