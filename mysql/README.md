# MySQL Module

This module provisions an IBM Cloud Databases for MySQL instance.

## Usage

```hcl
module "mysql" {
  source            = "./mysql"
  name              = "my-mysql-instance"
  resource_group_id = "my-resource-group-id"
  region            = "us-south"
  admin_pass        = "your-password" # Replace with a strong password
  mysql_version     = "8.0"
  tags              = ["database", "mysql"]
}
```

## Inputs

| Name                | Description                               | Type         | Default | Required |
| ------------------- | ----------------------------------------- | ------------ | ------- | -------- |
| `name`              | The name of the MySQL instance.           | `string`     | n/a     | yes      |
| `resource_group_id` | The ID of the resource group.             | `string`     | n/a     | yes      |
| `region`            | The IBM Cloud region for deployment.      | `string`     | n/a     | yes      |
| `mysql_version`     | Version of the MySQL instance to provision. | `string`     | `"8.0"` | no       |
| `admin_pass`        | The administrator password for the database.| `string`     | n/a     | yes      |
| `tags`              | A list of tags to apply to the instance.  | `list(string)` | `[]`    | no       |

## Outputs

| Name                | Description                                 |
| ------------------- | ------------------------------------------- |
| `connection_string` | The connection string for the MySQL database. |
| `id`                | The ID of the created MySQL instance.       |
| `name`              | The name of the MySQL instance.             |
