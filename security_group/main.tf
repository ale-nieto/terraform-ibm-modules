resource "ibm_is_security_group" "this" {
  name           = var.name
  vpc            = var.vpc_id
  resource_group = var.resource_group_id
  tags           = var.tags
}

resource "ibm_is_security_group_rule" "ingress_tcp" {
  for_each  = { for index, rule in var.rules_ingress_tcp : index => rule }
  group     = ibm_is_security_group.this.id
  direction = "inbound"
  remote    = each.value.remote

  tcp {
    port_min = each.value.port_min
    port_max = each.value.port_max
  }
}

resource "ibm_is_security_group_rule" "ingress_udp" {
  for_each  = { for index, rule in var.rules_ingress_udp : index => rule }
  group     = ibm_is_security_group.this.id
  direction = "inbound"
  remote    = each.value.remote
  
  udp {
    port_min = each.value.port_min
    port_max = each.value.port_max
  }
}

resource "ibm_is_security_group_rule" "ingress_icmp" {
  for_each  = { for index, rule in var.rules_ingress_icmp : index => rule }
  group     = ibm_is_security_group.this.id
  direction = "inbound"
  remote    = each.value.remote
  
  icmp {
    type = each.value.type
    code = each.value.code
  }
}

resource "ibm_is_security_group_rule" "egress_tcp" {
  for_each  = { for index, rule in var.rules_egress_tcp : index => rule }
  group     = ibm_is_security_group.this.id
  direction = "outbound"
  remote    = each.value.remote

  tcp {
    port_min = each.value.port_min
    port_max = each.value.port_max
  }
}

resource "ibm_is_security_group_rule" "egress_udp" {
  for_each  = { for index, rule in var.rules_egress_udp : index => rule }
  group     = ibm_is_security_group.this.id
  direction = "outbound"
  remote    = each.value.remote
  
  udp {
    port_min = each.value.port_min
    port_max = each.value.port_max
  }
}

resource "ibm_is_security_group_rule" "egress_icmp" {
  for_each  = { for index, rule in var.rules_egress_icmp : index => rule }
  group     = ibm_is_security_group.this.id
  direction = "outbound"
  remote    = each.value.remote
  
  icmp {
    type = each.value.type
    code = each.value.code
  }
}

resource "ibm_is_security_group_rule" "ingress_any" {
  for_each  = { for index, rule in var.rules_ingress_any : index => rule }
  group     = ibm_is_security_group.this.id
  direction = "inbound"
  remote    = each.value.remote
}

resource "ibm_is_security_group_rule" "egress_any" {
  for_each  = { for index, rule in var.rules_egress_any : index => rule }
  group     = ibm_is_security_group.this.id
  direction = "outbound"
  remote    = each.value.remote
}
