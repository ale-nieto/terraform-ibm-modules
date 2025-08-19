locals {
  # Naming convention logic from AP35926
  zone_codes = {
    "us-south-1"   = "da1",
    "us-south-2"   = "da2",
    "washington-1" = "wa1",
    "washington-2" = "wa2"
  }
  
  ambiente = {
    "production"  = "p",
    "staging"     = "s",
    "development" = "d",
"testing" = "t"
  }

  role_codes = {
    "frontend"    = "fa",
    "application" = "ap",
    "database"    = "dd",
    "loadbalancer"= "lb"
  }

  # Cleaner app number extraction from oficina-virtual
  app_numbers = regex("(\\d+)", var.APM)[0]

  # Combined name prefix construction
  name_prefix = "${lookup(local.zone_codes, var.zone)}a${local.app_numbers}${lookup(local.ambiente, var.ambiente)}"

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
