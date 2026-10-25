output "aks_vnet_id" {
  value = azurerm_virtual_network.aks_vnet.id
}

output "aks_cluster_id" {
  value = azurerm_kubernetes_cluster.aks_cluster.id
}

output "aks_cluster_name" {
  value = azurerm_kubernetes_cluster.aks_cluster.name
}

output "acr_id" {
  value = azurerm_container_registry.acr.id
}

output "acr_login_server" {
  value = azurerm_container_registry.acr.login_server
}

output "log_analytics_workspace_id" {
  value = azurerm_log_analytics_workspace.aks_logs.id
}
