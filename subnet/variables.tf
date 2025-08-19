
variable "resource_group" {
  description = "ID of the resource group"
  type        = string
}

variable "region" {
  description = "Region of Service"
  type        = string
}

variable "subnets" {
  description = "Configuration for subnets"
  type = map(object({
    zone            = string
    ipv4_cidr_block = string
  }))
}
variable "vpc" {
  description = "Name of the VPC"
  type        = string
}