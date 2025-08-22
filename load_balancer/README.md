# Load Balancer Module

This module provisions a public IBM Cloud Load Balancer, along with listeners, pools, and pool members.

## Usage

```hcl
module "load_balancer" {
  source             = "./load_balancer"
  name               = "my-lb"
  resource_group_id  = "my-resource-group-id"
  subnet_ids         = ["subnet-id-1", "subnet-id-2"]
  security_group_ids = ["sg-id-1"]
  tags               = ["tag1", "tag2"]

  listeners = [
    {
      port             = 80
      protocol         = "http"
      pool_algorithm   = "round_robin"
      health_type      = "http"
      health_delay     = 5
      health_retries   = 2
      health_timeout   = 2
      health_monitor_url = "/"
    }
  ]

  pool_members = [
    {
      listener_port = 80
      address       = "192.168.1.100"
      port          = 8080
    }
  ]
}
```

## Inputs

| Name                 | Description                                       | Type                                                                                                                                                            | Default | Required |
| -------------------- | ------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------- | -------- |
| `name`               | Name of the Load Balancer.                        | `string`                                                                                                                                                        | n/a     | yes      |
| `resource_group_id`  | ID of the resource group.                         | `string`                                                                                                                                                        | n/a     | yes      |
| `subnet_ids`         | List of subnets (one per zone).                   | `list(string)`                                                                                                                                                  | n/a     | yes      |
| `tags`               | Optional tags.                                    | `list(string)`                                                                                                                                                  | `[]`    | no       |
| `security_group_ids` | List of security group IDs for the Load Balancer. | `list(string)`                                                                                                                                                  | `[]`    | no       |
| `listeners`          | Listener definitions.                             | `list(object({ port = number, protocol = string, pool_algorithm = string, health_type = string, health_delay = number, health_retries = number, health_timeout = number, health_monitor_url = optional(string, "") }))` | n/a     | yes      |
| `pool_members`       | Pool members.                                     | `list(object({ listener_port = number, address = string, port = number }))`                                                                                    | n/a     | yes      |

## Outputs

| Name               | Description                       |
| ------------------ | --------------------------------- |
| `load_balancer_id` | The ID of the Load Balancer.      |
| `public_ip`        | The public IP of the Load Balancer. |
| `lb_name`          | The name of the Load Balancer.    |
| `lb_hostname`      | The hostname of the Load Balancer.|
