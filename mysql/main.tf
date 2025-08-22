resource "ibm_database" "mysql_db" {
  name              = var.name
  resource_group_id = var.resource_group_id
  service           = "databases-for-mysql"
  plan              = "standard"
  location          = var.region
  adminpassword     = var.admin_pass
  version           = var.mysql_version
  tags              = var.tags
  service_endpoints = var.service_endpoints

  users {
    name = var.db_user
    password = var.db_password
    type = "database"
  }
}

data "ibm_database_connection" "db_connection" {
  deployment_id = ibm_database.mysql_db.id
  user_type     = "database"
  user_id       = ibm_database.mysql_db.adminuser
  endpoint_type = "public"
}