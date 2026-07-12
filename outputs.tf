output "container_registry_scope_maps_actions" {
  description = "Map of actions values across all container_registry_scope_maps, keyed the same as var.container_registry_scope_maps"
  value       = { for k, v in azurerm_container_registry_scope_map.container_registry_scope_maps : k => v.actions }
}
output "container_registry_scope_maps_container_registry_name" {
  description = "Map of container_registry_name values across all container_registry_scope_maps, keyed the same as var.container_registry_scope_maps"
  value       = { for k, v in azurerm_container_registry_scope_map.container_registry_scope_maps : k => v.container_registry_name }
}
output "container_registry_scope_maps_description" {
  description = "Map of description values across all container_registry_scope_maps, keyed the same as var.container_registry_scope_maps"
  value       = { for k, v in azurerm_container_registry_scope_map.container_registry_scope_maps : k => v.description }
}
output "container_registry_scope_maps_name" {
  description = "Map of name values across all container_registry_scope_maps, keyed the same as var.container_registry_scope_maps"
  value       = { for k, v in azurerm_container_registry_scope_map.container_registry_scope_maps : k => v.name }
}
output "container_registry_scope_maps_resource_group_name" {
  description = "Map of resource_group_name values across all container_registry_scope_maps, keyed the same as var.container_registry_scope_maps"
  value       = { for k, v in azurerm_container_registry_scope_map.container_registry_scope_maps : k => v.resource_group_name }
}

