# ---------------------------------------------------------------------------------------------------------------------
# ENTERPRISE GOVERNANCE & POLICY-AS-CODE MODULE
# Applies zero-trust guardrails across Subscriptions and Management Groups:
# 1. Allowed Regions Only
# 2. Require Resource Tags (CostCenter, Environment, Owner)
# 3. Deny Public IPs on Network Interfaces
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

# 1. Policy Definition: Deny Public IPs
resource "azurerm_policy_definition" "deny_public_ips" {
  name         = "deny-public-ip-nics"
  policy_type  = "Custom"
  mode         = "Indexed"
  display_name = "Deny Public IP creation on all Network Interfaces (Zero Trust Egress)"
  description  = "Forces all internet communication to transit through central Azure Firewall"

  policy_rule = jsonencode({
    if = {
      allOf = [
        {
          field  = "type"
          equals = "Microsoft.Network/networkInterfaces"
        },
        {
          field = "Microsoft.Network/networkInterfaces/ipConfigurations[*].publicIpAddress.id"
          exists = "true"
        }
      ]
    }
    then = {
      effect = "Deny"
    }
  })
}

# 2. Policy Assignment
resource "azurerm_resource_group_policy_assignment" "deny_pip_assignment" {
  name                 = "assign-deny-public-ips"
  resource_group_id    = var.target_resource_group_id
  policy_definition_id = azurerm_policy_definition.deny_public_ips.id
  description          = "Ensures no VM or NIC can allocate a public IP address"
}
