resource "ibm_pi_workspace" "powervs-ws" {
  pi_name           = "${var.app_name}-dr-${var.region}"
  pi_datacenter     = var.region
  pi_resource_group_id = data.ibm_resource_group.rg.id
}

/*
resource "ibm_pi_network" "power_networks" {
  pi_network_name      = "${var.app_name}-dr-${var.zone}-net"
  pi_cloud_instance_id = ibm_pi_workspace.powervs-ws.id
  pi_network_type      = "vlan"
  pi_cidr              = var.net_prefix
}

*/