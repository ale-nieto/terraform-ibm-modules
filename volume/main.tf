resource "ibm_is_volume" "this" {
  name              = var.name
  zone              = var.zone
  profile           = var.profile
  capacity          = var.capacity
  resource_group    = var.resource_group_id
  tags              = var.tags
}
