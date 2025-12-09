resource "ibm_is_virtual_endpoint_gateway" "vpe" {
  name           = var.name
  resource_group = var.resource_group_id
  vpc            = var.vpc_id
  target {
    crn = var.target_crn
  }

  # Binding to specific subnets
  dynamic "ips" {
    for_each = var.subnet_ids
    content {
      subnet = ips.value
      name   = "${var.name}-ip-${ips.key}"
    }
  }

  security_groups = var.security_group_ids
  tags            = var.tags
}
