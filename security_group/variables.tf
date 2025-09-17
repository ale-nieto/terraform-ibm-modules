variable "name" {
  description = "Nombre del security group"
  type        = string
}
variable "vpc_id" {
  description = "ID de la VPC"
  type        = string
}

variable "resource_group_id" {
  description = "ID del resource group"
  type        = string
}

variable "tags" {
  description = "Tags opcionales"
  type        = list(string)
  default     = []
}

variable "rules_ingress_tcp" {
  description = "Lista de reglas de entrada TCP"
  type = list(object({
    remote    = string
    port_min  = number
    port_max  = number
  }))
  default = []
}

variable "rules_ingress_udp" {
  description = "Lista de reglas de entrada UDP"
  type = list(object({
    remote    = string
    port_min  = number
    port_max  = number
  }))
  default = []
}

variable "rules_ingress_icmp" {
  description = "Lista de reglas de entrada ICMP"
  type = list(object({
    remote    = string
    type      = optional(number)
    code      = optional(number)
  }))
  default = []
}

variable "rules_egress_tcp" {
  description = "Lista de reglas de salida TCP"
  type = list(object({
    remote    = string
    port_min  = number
    port_max  = number
  }))
  default = []
}

variable "rules_egress_udp" {
  description = "Lista de reglas de salida UDP"
  type = list(object({
    remote    = string
    port_min  = number
    port_max  = number
  }))
  default = []
}

variable "rules_egress_icmp" {
  description = "Lista de reglas de salida ICMP"
  type = list(object({
    remote    = string
    type      = optional(number)
    code      = optional(number)
  }))
  default = []
}

variable "rules_ingress_any" {
  description = "Lista de reglas de entrada para cualquier protocolo"
  type = list(object({
    remote = string
  }))
  default = []
}

variable "rules_egress_any" {
  description = "Lista de reglas de salida para cualquier protocolo"
  type = list(object({
    remote = string
  }))
  default = []
}
