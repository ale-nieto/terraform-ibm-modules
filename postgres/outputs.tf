output "id" {
  description = "The ID of the created Postgres instance."
  value       = ibm_database.postgres_db.id
}

output "name" {
  description = "The name of the Postgres instance."
  value       = ibm_database.postgres_db.name
}
