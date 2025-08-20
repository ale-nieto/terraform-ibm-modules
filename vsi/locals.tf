locals {
  # Naming convention logic from AP35926
   zone_codes = {
    "us-south-1"   = "da1",
    "us-south-2"   = "da2",
    "washington-1" = "wa1",
    "washington-2" = "wa2"
  }

  ambiente_codes = {
    "production"  = "p",
    "qa"     = "q",
    "testing"     = "t",
    "development" = "d"
  }

 role_codes = {
    "frontend"       = "fe",
    "application"    = "ap",
    "database"       = "db",
    "loadbalancer"   = "lb",
    "security_group" = "sg",
    "cos"            = "cos",
    "bucket"         = "bucket"
  }

  # Cleaner app number extraction from oficina-virtual
  app_numbers = regex("(\\d+)", var.APM)[0]

  # Combined name prefix construction
  name_prefix = "${lookup(local.zone_codes, var.zone)}a${local.app_numbers}${lookup(local.ambiente_codes, var.ambiente)}"

  # Volume attachment logic from oficina-virtual
  vsi_indices = range(var.vsi_count)

  volume_indices = try(var.data_volume.enabled, false) ? range(var.data_volume.count) : []

  attachments = flatten([
    for vsi_idx in local.vsi_indices : [
      for vol_idx in local.volume_indices : {
        vsi_index = vsi_idx
        vol_index = vol_idx
      }
    ]
  ])
}
