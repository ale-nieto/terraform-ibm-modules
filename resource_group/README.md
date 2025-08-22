# Resource Group Module

This module creates or retrieves an IBM Cloud Resource Group. It can be configured to either provision a new resource group or use an existing one.

## Usage

### Create a new resource group

```hcl
module "resource_group" {
  source           = "./resource_group"
  resource_group   = "my-new-rg"
  rg_create        = true
  tags             = ["env:dev", "team:a"]
}
```

### Use an existing resource group

```hcl
module "resource_group" {
  source           = "./resource_group"
  resource_group   = "my-existing-rg"
  rg_create        = false
}
```

## Inputs

| Name             | Description                                       | Type         | Default | Required |
| ---------------- | ------------------------------------------------- | ------------ | ------- | -------- |
| `resource_group` | Name of the Resource Group.                       | `string`     | n/a     | yes      |
| `rg_create`      | Set to `true` to create the Resource Group.       | `bool`       | `false` | no       |
| `tags`           | Optional tags, only applied on creation.          | `list(string)` | `[]`    | no       |

## Outputs

| Name                | Description                     |
| ------------------- | ------------------------------- |
| `resource_group_id` | The ID of the resource group.   |
