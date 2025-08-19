variable "name" {
  description = "The name of the MySQL instance."
  type        = string
}

variable "resource_group_id" {
  description = "The ID of the resource group."
  type        = string
}

variable "region" {
  description = "The IBM Cloud region for deployment."
  type        = string
}

variable "mysql_version" {
  description = "Version of the MySQL instance to provision."
  type        = string
  default     = "8.0"
}

variable "admin_pass" {
  description = "The administrator password for the database."
  type        = string
  sensitive   = true
}

variable "tags" {
  description = "A list of tags to apply to the instance."
  type        = list(string)
  default     = []
}
