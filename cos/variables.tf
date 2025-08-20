variable "name" {
  description = "Name of the COS instance."
  type        = string
}

variable "resource_group_id" {
  description = "ID of the resource group."
  type        = string
}

variable "instance_region" {
  description = "Region for the COS instance."
  type        = string
  default     = "global"
}

variable "bucket_region" {
  description = "Region for the COS bucket."
  type        = string
}

variable "tags" {
  description = "Tags for the COS instance."
  type        = list(string)
  default     = []
}

variable "bucket_name" {
  description = "Name of the COS bucket."
  type        = string
}

variable "storage_class" {
  description = "Storage class for the COS bucket."
  type        = string
}

variable "endpoint_type" {
  description = "Endpoint type for the COS bucket."
  type        = string
}