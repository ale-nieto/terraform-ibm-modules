resource "ibm_resource_instance" "cos_instance" {
  name              = var.name
  service           = "cloud-object-storage"
  plan              = "standard"
  location          = var.instance_region
  resource_group_id = var.resource_group_id
  tags              = var.tags
}

resource "ibm_cos_bucket" "bucket" {
  bucket_name          = var.bucket_name
  resource_instance_id = ibm_resource_instance.cos_instance.id
  region_location      = var.bucket_region
  storage_class        = var.storage_class
  endpoint_type        = var.endpoint_type
}