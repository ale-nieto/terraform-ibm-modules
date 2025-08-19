output "load_balancer_id" {
  value = ibm_is_lb.this.id
}

output "public_ip" {
  value = ibm_is_lb.this.public_ips
}

output "lb_name" {
  value = ibm_is_lb.this.name
}

output "lb_hostname" {
  value = ibm_is_lb.this.hostname
}
