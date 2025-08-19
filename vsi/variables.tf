variable "APM" {
  description = "Nombre del APM"
  type        = string
}

variable "vsi_role" {
  description = "Rol de la VSI (frontend, application, database, loadbalancer)"
  type        = string
}

variable "ambiente" {
  description = "Ambiente (production, staging, develop)"
  type        = string
}

variable "vsi_count" {
  description = "Numero de instancias VSI a crear"
  type        = number
  default     = 1
}

variable "vpc_id" {
  description = "ID de la VPC"
  type        = string
}

variable "subnet_id" {
  description = "ID de la subnet"
  type        = string
}

variable "security_group_ids" {
  description = "Lista de SGs"
  type        = list(string)
}

variable "profile" {
  description = "Tipo de VSI (bx2-2x8, bx2-4x16, etc.)"
  type        = string
}

variable "image" {
  description = "ID de la imagen (marketplace o custom)"
  type        = string
}

variable "zone" {
  description = "Zona (us-south-1, etc.)"
  type        = string
}

variable "resource_group_id" {
  description = "ID del resource group"
  type        = string
}

variable "boot_volume_encryption" {
  description = "Tipo de encripción (default or custom CRK)"
  type        = string
  default     = "provider_managed"
}

variable "ssh_key_names" {
  description = "List of SSH key names to attach to the VSI"
  type        = list(string)
}

variable "ssh_key_ids" {
  description = "List of SSH key IDs to attach to the VSI"
  type        = list(string)
  default     = []
}

variable "tags" {
  description = "Lista de tags"
  type        = list(string)
  default     = []
}

variable "user_data" {
  description = "cloud-init o script"
  type        = string
  default     = null
}

variable "data_volume" {
  description = "Configuración de los discos de datos opcionales"
  type = object({
    enabled  = bool
    count    = number
    capacity = number
    profile  = string
  })
  default = {
    enabled  = false
    count    = 0
    capacity = 50
    profile  = "general-purpose"
  }
}

variable "subnet_cidr_block" {
  description = "The CIDR block of the subnet."
  type        = string
  default = ""
}
