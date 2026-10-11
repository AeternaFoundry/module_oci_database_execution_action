resource "oci_database_execution_action" "database_execution_actions" {
  for_each = var.database_execution_actions

  action_type         = each.value.action_type
  execution_window_id = each.value.execution_window_id
  action_params       = each.value.action_params
  compartment_id      = each.value.compartment_id
  defined_tags        = each.value.defined_tags
  freeform_tags       = each.value.freeform_tags

  dynamic "action_members" {
    for_each = each.value.action_members != null ? each.value.action_members : []
    content {
      estimated_time_in_mins   = action_members.value.estimated_time_in_mins
      member_id                = action_members.value.member_id
      member_order             = action_members.value.member_order
      status                   = action_members.value.status
      total_time_taken_in_mins = action_members.value.total_time_taken_in_mins
    }
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }
}

