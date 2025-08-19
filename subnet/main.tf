resource "ibm_is_vpc_address_prefix" "address_prefix" {
  for_each   = var.subnets
  name       = each.key
  cidr       = each.value.ipv4_cidr_block
  vpc        = var.vpc
  zone       = each.value.zone
  is_default = true
}

resource "ibm_is_subnet" "subnet" {
  depends_on = [ibm_is_vpc_address_prefix.address_prefix]
  for_each   = var.subnets

  name            = each.key
  vpc             = var.vpc
  zone            = each.value.zone
  ipv4_cidr_block = each.value.ipv4_cidr_block
  resource_group  = var.resource_group
}
