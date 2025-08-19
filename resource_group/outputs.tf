output "resource_group_id" {
  description = "The ID of the resource group."
  value       = var.rg_create ? one(ibm_resource_group.rg[*].id) : one(data.ibm_resource_group.rg[*].id)
}