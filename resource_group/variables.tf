variable "resource_group" {
  description = "Nombre del RG"
  type        = string
}

variable "rg_create" {
  description = "Indica si se debe crear el Resource Group"
  type        = bool
  default     = false
}