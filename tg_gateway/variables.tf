variable "tg_name" {
  description = "Nombre del transit gateway"
  type = string  
}

variable "region" {
  description = "Region of Service"
  type        = string
}

variable "resource_group" {
  description = "ID of the resource group"
  type        = string
}

variable "vpc_crn" {
  description = "Nombre de VPC"
  type = string
}