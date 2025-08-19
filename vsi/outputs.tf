output "vsi_ids" {
  value       = [for inst in ibm_is_instance.this : inst.id]
  description = "IDs of the created VSIs."
}

output "primary_ips" {
  value       = [for inst in ibm_is_instance.this : inst.primary_network_interface[0].primary_ip[0].address]
  description = "Primary IP addresses of the created VSIs."
}

output "vsi_names" {
  value       = [for inst in ibm_is_instance.this : inst.name]
  description = "Names of the created VSIs."
}
