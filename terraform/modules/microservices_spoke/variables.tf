variable "resource_group_name" {
  type        = string
  description = "Resource group for Microservices Spoke"
}

variable "location" {
  type        = string
  description = "Azure Region"
}

variable "aks_vnet_name" {
  type        = string
  default     = "vnet-spoke-microservices-prod"
}

variable "aks_address_space" {
  type        = string
  default     = "172.16.32.0/20"
}

variable "aks_nodes_subnet_prefix" {
  type        = string
  default     = "172.16.32.0/22"
}

variable "ingress_subnet_prefix" {
  type        = string
  default     = "172.16.36.0/24"
}

variable "hub_vnet_id" {
  type        = string
  description = "Hub Virtual Network ID"
}

variable "hub_route_table_id" {
  type        = string
  description = "Hub Route Table ID for forced egress"
}

variable "acr_name" {
  type        = string
  default     = "acrprodplatformsec01"
}

variable "aks_cluster_name" {
  type        = string
  default     = "aks-microservices-prod-01"
}

variable "aad_admin_group_id" {
  type        = string
  description = "Microsoft Entra ID Object ID for AKS Cluster Admins"
  default     = "00000000-0000-0000-0000-000000000000"
}

variable "tags" {
  type        = map(string)
  default     = {
    Environment = "Production"
    Tier        = "Cloud-Native-Microservices"
    ManagedBy   = "Terraform"
  }
}
