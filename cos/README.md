# COS Module

This module provisions an IBM Cloud Object Storage (COS) instance and a COS bucket.

## Usage

```hcl
module "cos" {
  source              = "./cos"
  name                = "my-cos-instance"
  resource_group_id   = "my-resource-group-id"
  instance_region     = "us-south"
  bucket_name         = "my-bucket"
  bucket_region       = "us-south"
  storage_class       = "standard"
  endpoint_type       = "public"
  tags                = ["tag1", "tag2"]
  force_delete        = true
}
```

## Inputs

| Name                | Description                      | Type         | Default | Required |
| ------------------- | -------------------------------- | ------------ | ------- | -------- |
| `name`              | Name of the COS instance.        | `string`     | n/a     | yes      |
| `resource_group_id` | ID of the resource group.        | `string`     | n/a     | yes      |
| `instance_region`   | Region for the COS instance.     | `string`     | `global`| no       |
| `bucket_region`     | Region for the COS bucket.       | `string`     | n/a     | yes      |
| `tags`              | Tags for the COS instance.       | `list(string)` | `[]`    | no       |
| `bucket_name`       | Name of the COS bucket.          | `string`     | n/a     | yes      |
| `storage_class`     | Storage class for the COS bucket.| `string`     | n/a     | yes      |
| `endpoint_type`     | Endpoint type for the COS bucket.| `string`     | n/a     | yes      |
| `force_delete`      | Force deletion of the COS bucket.| `bool`       | `false` | no       |

## Outputs

| Name                  | Description                                             |
| --------------------- | ------------------------------------------------------- |
| `cos_endpoint`        | The public endpoint for the Cloud Object Storage instance. |
| `cos_bucket_name`     | The name of the Cloud Object Storage bucket.            |
| `s3_endpoint_direct`  | The direct S3 endpoint for the bucket.                  |
| `s3_endpoint_public`  | The public S3 endpoint for the bucket.                  |
| `s3_endpoint_private` | The private S3 endpoint for the bucket.                 |
| `id`                  | The ID of the created COS instance.                     |
