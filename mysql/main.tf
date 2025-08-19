resource "ibm_database" "mysql_db" {
  name              = var.name
  resource_group_id = var.resource_group_id
  service           = "databases-for-mysql"
  plan              = "standard"
  location          = var.region
  adminpassword     = var.admin_pass
  version           = var.mysql_version
  tags              = var.tags
  service_endpoints = "public-and-private"
}

data "ibm_database_connection" "db_connection" {
  deployment_id = ibm_database.mysql_db.id
  user_type     = "database"
  user_id       = ibm_database.mysql_db.adminuser
  endpoint_type = "public"
}