
resource "ibm_tg_connection" "vpc_tg_connection" {

  for_each = var.tg_gw_conns

  gateway      = var.gateway
  network_type = each.value.network_type
  name         = each.value.name
  network_id   = each.value.network_id
}
