/* output "connection_string" {
  description = "The connection string for the MySQL database."
  value       = data.ibm_database_connection.db_connection.mysql
  sensitive   = true
} */
output "id" {
  description = "The ID of the created MySQL instance."
  value       = ibm_database.mysql_db.id
}

output "name" {
  description = "The name of the MySQL instance."
  value       = ibm_database.mysql_db.name
}