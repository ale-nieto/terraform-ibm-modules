resource "ibm_is_vpc_routing_table_route" "route" {
  for_each = var.route_configs

  vpc           = data.ibm_is_vpc.vpc.id
  routing_table = each.value.routing_table
  name          = each.key
  destination   = each.value.destination
  next_hop      = each.value.next_hop != null ? each.value.next_hop : var.next_hop  # Use override if present, else default
  priority      = each.value.priority
  zone          = each.value.zone

  lifecycle {
     ignore_changes = [action, advertise,routing_table,vpc]  # Uncomment if replacements persist
  }
}


data "ibm_is_vpc" "vpc" {

  name = var.vpc
}