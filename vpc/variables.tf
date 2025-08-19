  variable "resource_group" {
  description = "Name of the IBM Cloud resource group (e.g., 'SAP')"
  type        = string
}

variable "vpc_name" {
  description = "Nombre de VPC"
  type = string
}

variable "region" {
  description = "Region of Service"
  type        = string
}