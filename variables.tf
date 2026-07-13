variable "container_registry_scope_maps" {
  description = <<EOT
Map of container_registry_scope_maps, attributes below
Required:
    - actions
    - container_registry_name
    - name
    - resource_group_name
Optional:
    - description
EOT

  type = map(object({
    actions                 = list(string)
    container_registry_name = string
    name                    = string
    resource_group_name     = string
    description             = optional(string)
  }))
  validation {
    condition = alltrue([
      for k, v in var.container_registry_scope_maps : (
        length(v.name) < 50
      )
    ])
    error_message = "[from validate.ContainerRegistryScopeMapName: invalid when len(value) >= 50]"
  }
  validation {
    condition = alltrue([
      for k, v in var.container_registry_scope_maps : (
        v.description == null || (length(v.description) >= 1 && length(v.description) <= 256)
      )
    ])
    error_message = "must be between 1 and 256 characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.container_registry_scope_maps : (
        length(v.resource_group_name) <= 90
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) > 90]"
  }
  validation {
    condition = alltrue([
      for k, v in var.container_registry_scope_maps : (
        !endswith(v.resource_group_name, ".")
      )
    ])
    error_message = "[from resourcegroups.ValidateName: must not end with \".\"]"
  }
  validation {
    condition = alltrue([
      for k, v in var.container_registry_scope_maps : (
        length(v.resource_group_name) != 0
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) == 0]"
  }
  validation {
    condition = alltrue([
      for k, v in var.container_registry_scope_maps : (
        length(v.container_registry_name) <= 50
      )
    ])
    error_message = "[from validate.ContainerRegistryName: invalid when len(value) > 50]"
  }
  validation {
    condition = alltrue([
      for k, v in var.container_registry_scope_maps : (
        alltrue([for x in v.actions : length(x) > 0])
      )
    ])
    error_message = "must not be empty"
  }
  # Note: 5 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

