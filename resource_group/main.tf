resource "ibm_resource_group" "rg" {
  count = var.rg_create ? 1 : 0
  name  = var.resource_group


}

data "ibm_resource_group" "rg" {
  # This data source will only run if the creation variable is false.
  count = var.rg_create ? 0 : 1

  name = var.resource_group
}
