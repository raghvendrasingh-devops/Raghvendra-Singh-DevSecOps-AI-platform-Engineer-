output "hub_vnet_id" {
  description = "The ID of the Hub Virtual Network"
  value       = azurerm_virtual_network.hub_vnet.id
}

output "hub_vnet_name" {
  description = "The Name of the Hub Virtual Network"
  value       = azurerm_virtual_network.hub_vnet.name
}

output "firewall_private_ip" {
  description = "Private IP of the Azure Firewall for UDR routing"
  value       = azurerm_firewall.hub_firewall.ip_configuration[0].private_ip_address
}

output "route_table_id" {
  description = "Route Table ID enforcing centralized egress via Azure Firewall"
  value       = azurerm_route_table.spoke_egress_rt.id
}

output "private_dns_zone_blob_id" {
  description = "Private DNS Zone ID for Azure Storage Blobs"
  value       = azurerm_private_dns_zone.privatelink_blob.id
}
