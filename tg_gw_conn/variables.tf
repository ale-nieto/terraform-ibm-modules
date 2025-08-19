
variable "vpc_crn" {
  description = "Nombre de VPC"
  type = string
}

variable "gateway" {
  type = string
}

variable "tg_gw_conns" {
  description = "Mapa de subnets con nombre, zona y CIDR"
  type = map(object({
    network_type        = string
    name = string
    network_id = string
  }))
}