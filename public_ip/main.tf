resource "ibm_is_floating_ip" "this" {
  name              = var.name
  target            = var.target_id
  resource_group    = var.resource_group_id
  tags              = var.tags
}
