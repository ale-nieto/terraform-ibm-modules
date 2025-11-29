variable "name" {
  description = "Nombre del Load Balancer"
  type        = string
}

variable "resource_group_id" {
  description = "ID del resource group"
  type        = string
}

variable "subnet_ids" {
  description = "Lista de subnets (una por zona)"
  type        = list(string)
}

variable "tags" {
  description = "Tags opcionales"
  type        = list(string)
  default     = []
}

variable "security_group_ids" {
  description = "Lista de IDs de security groups para el Load Balancer"
  type        = list(string)
  default     = []
}

variable "listeners" {
  description = "Definiciones de listeners"
  type = list(object({
    port               = number
    protocol           = string
    pool_algorithm     = string
    health_type        = string
    health_delay       = number
    health_retries     = number
    health_timeout     = number
    health_monitor_url = optional(string, "")
    certificate_crn    = optional(string, null)
  }))
}

variable "pool_members" {
  description = "Miembros del pool"
  type = list(object({
    listener_port = number
    address       = string
    port          = number
  }))
}

variable "policies" {
  description = "Lista de politicas para aplicar a los listeners"
  type = list(object({
    listener_port = number
    action        = string
    priority      = number
    rules = list(object({
      condition = string
      type      = optional(string)
      value     = string
      field     = optional(string)
    }))
  }))
  default = []
}
