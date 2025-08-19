output "route_ids" {
  value       = { for k, v in ibm_is_vpc_routing_table_route.route : k => v.id }
  description = "Map of route names to their IDs"
}

output "route_next_hop" {
  value       = { for k, v in ibm_is_vpc_routing_table_route.route : k => v.next_hop }
  description = "Map of route names to their next hop"
}