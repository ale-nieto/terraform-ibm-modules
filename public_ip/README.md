# Public IP Module

This module provisions an IBM Cloud Floating IP and attaches it to a target resource.

## Usage

```hcl
module "public_ip" {
  source            = "./public_ip"
  name              = "my-public-ip"
  target_id         = "r006-bc25d627-51a9-4966-8eca-0336e2d10a45"
  resource_group_id = "my-resource-group-id"
  tags              = ["networking", "public-ip"]
}
```

## Inputs

| Name                | Description                                                       | Type         | Default | Required |
| ------------------- | ----------------------------------------------------------------- | ------------ | ------- | -------- |
| `name`              | Name of the Public IP.                                            | `string`     | n/a     | yes      |
| `target_id`         | ID of the target (e.g., a VSI's network_interface.id).            | `string`     | n/a     | yes      |
| `resource_group_id` | ID of the resource group.                                         | `string`     | n/a     | yes      |
| `tags`              | Optional tags.                                                    | `list(string)` | `[]`    | no       |

## Outputs

| Name          | Description                     |
| ------------- | ------------------------------- |
| `floating_ip` | The address of the floating IP. |
