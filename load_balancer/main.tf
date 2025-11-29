resource "ibm_is_lb" "this" {
  name            = var.name
  subnets         = var.subnet_ids
  resource_group  = var.resource_group_id
  type            = "public"
  tags            = var.tags
  security_groups = var.security_group_ids
}

resource "ibm_is_lb_listener" "this" {
  for_each             = { for listener in var.listeners : listener.port => listener }
  lb                   = ibm_is_lb.this.id
  port                 = each.value.port
  protocol             = each.value.protocol
  default_pool         = ibm_is_lb_pool.this[each.key].id
  certificate_instance = each.value.protocol == "https" ? each.value.certificate_crn : null
}

resource "ibm_is_lb_pool" "this" {
  for_each  = { for listener in var.listeners : listener.port => listener }
  lb        = ibm_is_lb.this.id
  name      = "${var.name}-pool-${each.key}"
  protocol  = each.value.protocol
  algorithm = each.value.pool_algorithm

  health_type        = each.value.health_type
  health_delay       = each.value.health_delay
  health_retries     = each.value.health_retries
  health_monitor_url = each.value.health_monitor_url
  health_timeout     = each.value.health_timeout
}

resource "ibm_is_lb_pool_member" "this" {
  for_each       = { for idx, member in var.pool_members : "${member.listener_port}-${member.port}-${idx}" => member }
  lb             = ibm_is_lb.this.id
  pool           = ibm_is_lb_pool.this[each.value.listener_port].id
  port           = each.value.port
  target_address = each.value.address
}

resource "ibm_is_lb_listener_policy" "this" {
  for_each = { for idx, policy in var.policies : "${policy.listener_port}-${idx}" => policy }
  lb       = ibm_is_lb.this.id
  listener = ibm_is_lb_listener.this[each.value.listener_port].listener_id
  action   = each.value.action
  priority = each.value.priority
}

resource "ibm_is_lb_listener_policy_rule" "this" {
  for_each = { for idx, rule in flatten([
    for p_idx, policy in var.policies : [
      for r_idx, rule in policy.rules : {
        policy_key = "${policy.listener_port}-${p_idx}"
        rule       = rule
        key        = "${policy.listener_port}-${p_idx}-${r_idx}"
      }
    ]
  ]) : rule.key => rule }

  lb        = ibm_is_lb.this.id
  listener  = ibm_is_lb_listener.this[each.value.rule.listener_port].listener_id
  policy    = ibm_is_lb_listener_policy.this[each.value.policy_key].policy_id
  condition = each.value.rule.condition
  type      = each.value.rule.type
  value     = each.value.rule.value
  field     = each.value.rule.field
}

