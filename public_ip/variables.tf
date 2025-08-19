variable "name" {
  description = "Nombre de la IP pública"
  type        = string
}

variable "target_id" {
  description = "ID del target (network_interface.id del VSI o load_balancer.id)"
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
