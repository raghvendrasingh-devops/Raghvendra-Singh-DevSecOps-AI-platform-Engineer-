variable "location" {
  type        = string
  default     = "eastus2"
  description = "Azure Region for Production Workloads"
}

variable "tenant_id" {
  type        = string
  description = "Microsoft Entra ID Tenant ID"
  default     = "00000000-0000-0000-0000-000000000000"
}

variable "sql_admin_password" {
  type        = string
  sensitive   = true
  description = "Strong Administrator Password for Azure SQL Server"
  default     = "P@ssw0rdEnterprise2026!Secure"
}

variable "aad_admin_group_id" {
  type        = string
  description = "Microsoft Entra Group ID for AKS Administrators"
  default     = "00000000-0000-0000-0000-000000000000"
}

variable "tags" {
  type        = map(string)
  default     = {
    Environment      = "Production"
    Owner            = "Raghvendra-Singh"
    CostCenter       = "CC-10992-CoreOps"
    ArchitectureType = "CAF-Hub-and-Spoke"
    ManagedBy        = "Terraform-DevSecOps"
  }
}
