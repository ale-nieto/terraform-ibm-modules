output "subnet_ids" {
  value       = { for k, v in ibm_is_subnet.subnet : k => v.id }
  description = "Map of subnet names to their IDs"
}

output "subnet_ipv4_cidr_blocks" {
  value       = { for k, v in ibm_is_subnet.subnet : k => v.ipv4_cidr_block }
  description = "Map of subnet names to their CIDR blocks"
}