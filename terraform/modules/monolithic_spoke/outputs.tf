output "spoke_vnet_id" {
  value = azurerm_virtual_network.spoke_vnet.id
}

output "web_subnet_id" {
  value = azurerm_subnet.web_subnet.id
}

output "app_subnet_id" {
  value = azurerm_subnet.app_subnet.id
}

output "data_subnet_id" {
  value = azurerm_subnet.data_subnet.id
}

output "key_vault_id" {
  value = azurerm_key_vault.app_kv.id
}

output "sql_server_fqdn" {
  value = azurerm_mssql_server.sql_server.fully_qualified_domain_name
}
