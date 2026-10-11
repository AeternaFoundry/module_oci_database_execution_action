variable "database_execution_actions" {
  description = <<EOT
Map of database_execution_actions, attributes below
Required:
    - action_type
    - execution_window_id
Optional:
    - action_params
    - compartment_id
    - defined_tags
    - freeform_tags
    - action_members (block):
        - estimated_time_in_mins (optional)
        - member_id (required)
        - member_order (required)
        - status (optional)
        - total_time_taken_in_mins (optional)
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - update (optional)
EOT

  type = map(object({
    action_type         = string
    execution_window_id = string
    action_params       = optional(map(string))
    compartment_id      = optional(string)
    defined_tags        = optional(map(string))
    freeform_tags       = optional(map(string))
    action_members = optional(list(object({
      estimated_time_in_mins   = optional(number)
      member_id                = string
      member_order             = number
      status                   = optional(string)
      total_time_taken_in_mins = optional(number)
    })))
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      update = optional(string)
    }))
  }))
}

