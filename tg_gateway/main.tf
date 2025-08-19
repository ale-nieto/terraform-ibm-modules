
resource "ibm_tg_gateway" "tg_gw" {
  name           = var.tg_name
  location       = var.region
  global         = false
  resource_group = var.resource_group
}