data "ibm_is_image" "image" {
  name = var.image
}

data "ibm_is_ssh_key" "ssh_keys" {
  for_each = toset(var.ssh_key_names)
  name     = each.key
}

resource "ibm_is_instance" "this" {
  count             = var.vsi_count
  name              = "${local.name_prefix}${lookup(local.role_codes, var.vsi_role)}${format("%02d", count.index + 1)}"
  image             = data.ibm_is_image.image.id
  profile           = var.profile
  zone              = var.zone
  vpc               = var.vpc_id
  keys              = [for key in data.ibm_is_ssh_key.ssh_keys : key.id]
  resource_group    = var.resource_group_id
  tags              = var.tags

  primary_network_interface {
    subnet          = var.subnet_id
    security_groups = var.security_group_ids
  }

  user_data         = var.user_data != null ? base64encode(var.user_data) : null
}

resource "ibm_is_volume" "data" {
  for_each = { for att in local.attachments : "${att.vsi_index}-${att.vol_index}" => att }

  name           = "${ibm_is_instance.this[each.value.vsi_index].name}-data-${each.value.vol_index}"
  zone           = var.zone
  capacity       = var.data_volume.capacity
  profile        = var.data_volume.profile
  resource_group = var.resource_group_id
  tags           = var.tags
}

resource "ibm_is_instance_volume_attachment" "attach_data" {
  for_each = { for att in local.attachments : "${att.vsi_index}-${att.vol_index}" => att }

  instance = ibm_is_instance.this[each.value.vsi_index].id
  volume   = ibm_is_volume.data["${each.value.vsi_index}-${each.value.vol_index}"].id
  name     = "${ibm_is_instance.this[each.value.vsi_index].name}-attach-data-${each.value.vol_index}"
}
