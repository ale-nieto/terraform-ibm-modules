# /variables.tf

variable "region" {
  description = "Region of Service"
  type        = string
  default     = "us-east"
}
variable "zone" {
  description = "Zone of Service"
  type        = string
  default     = "wdc06"
}

variable "app_name" {
  description = "Name of the application"
  type        = string
}

variable "net_prefix" {
  description = "Network Prefix"
  type        = string    
}

variable "transit_gateway" {
  description = "Transit Gateway"
  type        = string
}

variable "digital_hub" {
  description = "Digital Hub"
  type        = string
}