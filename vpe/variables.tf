variable "name" {
  description = "Name of the VPE gateway"
  type        = string
}

variable "resource_group_id" {
  description = "Resource group ID"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID where the VPE will be created"
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs to bind the VPE to (one IP per subnet will be allocated)"
  type        = list(string)
}

variable "target_crn" {
  description = "The CRN of the service target (e.g., Postgres instance)"
  type        = string
}

variable "security_group_ids" {
  description = "List of security groups to attach to the VPE. If empty, a default allowing all traffic might be applied by the provider or it might fail if required."
  type        = list(string)
  default     = []
}

variable "tags" {
  description = "Tags"
  type        = list(string)
  default     = []
}
