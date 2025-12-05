resource "ibm_database" "postgres_db" {
  name              = var.name
  resource_group_id = var.resource_group_id
  service           = "databases-for-postgresql"
  plan              = "standard"
  location          = var.region
  adminpassword     = var.admin_pass
  version           = var.postgres_version
  tags              = var.tags
  service_endpoints = var.service_endpoints

  users {
    name     = var.db_user
    password = var.db_password
    type     = "database"
  }
}
