variable "route_configs" {
  description = "Configuration for VPC routing table routes"
  type = map(object({
    destination   = string
    next_hop      = string
    priority      = number
    zone          = string
    routing_table = string
  }))
}

variable "next_hop" {
  description = "Default next hop IP for routing table routes"
  type        = string
}

variable "vpc" {
  description = "Name of the VPC"
  type        = string 
}