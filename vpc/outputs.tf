output "vpc_ids" {
  value = ibm_is_vpc.vpc.id
  description = "Map of VPC names to their IDs"
}

output "vpc_crn" {
  value = ibm_is_vpc.vpc.resource_crn
}
