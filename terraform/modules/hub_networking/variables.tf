variable "resource_group_name" {
  description = "The name of the resource group for Hub Networking"
  type        = string
}

variable "location" {
  description = "Azure region where resources will be created"
  type        = string
}

variable "hub_vnet_name" {
  description = "Name of the Central Hub VNet"
  type        = string
  default     = "vnet-hub-core-prod-001"
}

variable "hub_address_space" {
  description = "Address space for the Hub VNet"
  type        = string
  default     = "172.16.0.0/20"
}

variable "firewall_subnet_prefix" {
  description = "CIDR prefix for AzureFirewallSubnet (Must be /26 or larger)"
  type        = string
  default     = "172.16.0.0/26"
}

variable "gateway_subnet_prefix" {
  description = "CIDR prefix for GatewaySubnet (Must be /27 or larger)"
  type        = string
  default     = "172.16.0.64/27"
}

variable "bastion_subnet_prefix" {
  description = "CIDR prefix for AzureBastionSubnet (Must be /26 or larger)"
  type        = string
  default     = "172.16.0.128/26"
}

variable "mgmt_subnet_prefix" {
  description = "CIDR prefix for Shared Management Subnet"
  type        = string
  default     = "172.16.1.0/24"
}

variable "tags" {
  description = "Tags applied to all resources"
  type        = map(string)
  default     = {
    Environment = "Core-Platform"
    ManagedBy   = "Terraform"
    Project     = "CAF-Enterprise-Landing-Zone"
  }
}
