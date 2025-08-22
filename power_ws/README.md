# PowerVS Workspace Module

This module provisions an IBM PowerVS Workspace.

## Usage

```hcl
module "power_ws" {
  source           = "./power_ws"
  app_name         = "my-app"
  region           = "us-east"
  zone             = "wdc06"
  net_prefix       = "192.168.0.0/24"
  transit_gateway  = "tg-gateway-id"
  digital_hub      = "digital-hub-id"
  resource_group   = "my-resource-group"
}
```

## Inputs

| Name             | Description           | Type     | Default   | Required |
| ---------------- | --------------------- | -------- | --------- | -------- |
| `region`         | Region of Service.    | `string` | `us-east` | no       |
| `zone`           | Zone of Service.      | `string` | `wdc06`   | no       |
| `app_name`       | Name of the application.| `string` | n/a       | yes      |
| `net_prefix`     | Network Prefix.       | `string` | n/a       | yes      |
| `transit_gateway`| Transit Gateway.      | `string` | n/a       | yes      |
| `digital_hub`    | Digital Hub.          | `string` | n/a       | yes      |
| `resource_group` | Resource Group.       | `string` | n/a       | yes      |

## Outputs

This module has no outputs.
