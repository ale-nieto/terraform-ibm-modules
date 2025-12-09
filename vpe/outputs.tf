output "vpe_id" {
  description = "The ID of the VPE gateway"
  value       = ibm_is_virtual_endpoint_gateway.vpe.id
}

output "vpe_ips" {
  description = "The list of IPs allocated to the VPE"
  value       = ibm_is_virtual_endpoint_gateway.vpe.ips
}
