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
        v.description == null || (length(v.description) >= 1 && length(v.description) <= 256)
      )
    ])
    error_message = "must be between 1 and 256 characters"
  }
  # --- Unconfirmed validation candidates, derived from azurerm_container_registry_scope_map's provider source ---
  # Not auto-enabled: either a bespoke provider validator we can't safely translate,
  # or a path that crosses a list-typed block (needs its own for_each wrapping).
  # Review, translate into a real validation{} block above, and delete once confirmed.
  # path: name
  #   source:    [from validate.ContainerRegistryScopeMapName] !regexp.MustCompile(`^[a-zA-Z0-9\-]+$`).MatchString(value)
  # path: name
  #   source:    [from validate.ContainerRegistryScopeMapName] 5 > len(value)
  # path: name
  #   condition: length(value) < 50
  #   message:   [from validate.ContainerRegistryScopeMapName: invalid when len(value) >= 50]
  #   source:    [from validate.ContainerRegistryScopeMapName: invalid when len(value) >= 50]
  # path: resource_group_name
  #   condition: length(value) <= 90
  #   message:   [from resourcegroups.ValidateName: invalid when len(value) > 90]
  #   source:    [from resourcegroups.ValidateName: invalid when len(value) > 90]
  # path: resource_group_name
  #   condition: !endswith(value, ".")
  #   message:   [from resourcegroups.ValidateName: must not end with "."]
  #   source:    [from resourcegroups.ValidateName: must not end with "."]
  # path: resource_group_name
  #   condition: length(value) != 0
  #   message:   [from resourcegroups.ValidateName: invalid when len(value) == 0]
  #   source:    [from resourcegroups.ValidateName: invalid when len(value) == 0]
  # path: resource_group_name
  #   source:    [from resourcegroups.ValidateName] !matched
  # path: container_registry_name
  #   source:    [from validate.ContainerRegistryName] !regexp.MustCompile(`^[a-zA-Z0-9]+$`).MatchString(value)
  # path: container_registry_name
  #   source:    [from validate.ContainerRegistryName] 5 > len(value)
  # path: container_registry_name
  #   condition: length(value) <= 50
  #   message:   [from validate.ContainerRegistryName: invalid when len(value) > 50]
  #   source:    [from validate.ContainerRegistryName: invalid when len(value) > 50]
  # path: actions[*]
  #   condition: length(value) > 0
  #   message:   must not be empty
}

