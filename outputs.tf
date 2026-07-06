output "container_registry_scope_maps" {
  description = "All container_registry_scope_map resources"
  value       = azurerm_container_registry_scope_map.container_registry_scope_maps
}
output "container_registry_scope_maps_actions" {
  description = "List of actions values across all container_registry_scope_maps"
  value       = [for k, v in azurerm_container_registry_scope_map.container_registry_scope_maps : v.actions]
}
output "container_registry_scope_maps_container_registry_name" {
  description = "List of container_registry_name values across all container_registry_scope_maps"
  value       = [for k, v in azurerm_container_registry_scope_map.container_registry_scope_maps : v.container_registry_name]
}
output "container_registry_scope_maps_description" {
  description = "List of description values across all container_registry_scope_maps"
  value       = [for k, v in azurerm_container_registry_scope_map.container_registry_scope_maps : v.description]
}
output "container_registry_scope_maps_name" {
  description = "List of name values across all container_registry_scope_maps"
  value       = [for k, v in azurerm_container_registry_scope_map.container_registry_scope_maps : v.name]
}
output "container_registry_scope_maps_resource_group_name" {
  description = "List of resource_group_name values across all container_registry_scope_maps"
  value       = [for k, v in azurerm_container_registry_scope_map.container_registry_scope_maps : v.resource_group_name]
}

