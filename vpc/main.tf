resource "ibm_is_vpc" "vpc" {
  name           = var.vpc_name
  resource_group = var.resource_group
  address_prefix_management = "manual"
}