variable "name" {
  type = string
}

variable "zone" {
  type = string
}

variable "profile" {
  type    = string
  default = "general-purpose"
}

variable "capacity" {
  type = number
}

variable "resource_group_id" {
  type = string
}

variable "tags" {
  type    = list(string)
  default = []
}
