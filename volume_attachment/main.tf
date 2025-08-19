resource "ibm_is_instance_volume_attachment" "this" {
  instance = var.instance_id
  volume   = var.volume_id
  name     = "${var.name}-attach"
}
