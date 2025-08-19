# Terraform Common Modules for IBM Cloud

## Overview

This repository contains a collection of reusable Terraform modules for provisioning infrastructure on IBM Cloud. The goal of this repository is to provide a centralized, standardized, and version-controlled library of modules that can be consumed by various application deployment projects.

By using these common modules, we ensure consistency, promote code reuse, and simplify the maintenance of our infrastructure as code.

## How to Use

To use a module from this repository in your Terraform project, you can reference it directly using a Git source address. It is highly recommended to pin the module to a specific version using a tag.

### Example

Here is how you would use the `vpc` module in your `main.tf`:

```terraform
module "my_vpc" {
  # Replace with the actual Git URL of this repository
  source = "git::https://github.com/your-username/common-modules.git//vpc?ref=v1.0.0"

  vpc_name       = "my-application-vpc"
  resource_group = "my-resource-group-id"
  region         = "us-south"
}
```

- **`source`**: The URL points to this Git repository. The `//` is important and separates the repository URL from the path to the module within the repository.
- **`?ref=v1.0.0`**: This pins the module to a specific version (Git tag). This is crucial for production stability. When you make changes to a module, you should create a new tag (e.g., `v1.0.1`) and update the `ref` in your application's code to consume the new version.

After adding a module, run `terraform init` to download it.

## Managing Environments

Different environments (e.g., development, staging, production) can be managed using separate `.tfvars` files. These files allow you to provide different input variables for each environment without changing the core Terraform code.

For example, you might have:

- `development.tfvars`
- `staging.tfvars`
- `production.tfvars`

To apply a plan for a specific environment, use the `-var-file` flag:

```bash
# Plan for development
terraform plan -var-file="development.tfvars"

# Apply for production
terraform apply -var-file="production.tfvars"
```

## Available Modules

Here is a list of the modules available in this repository:

| Module | Description |
| --- | --- |
| `cos` | Provisions an IBM Cloud Object Storage (COS) instance and a bucket. |
| `load_balancer` | Creates a public Load Balancer, along with listeners, pools, and pool members. |
| `mysql` | Provisions an IBM Cloud Databases for MySQL instance. |
| `power_ws` | Manages a Power Systems Virtual Server workspace. |
| `public_ip` | Associates a public IP address with a VSI. |
| `resource_group` | Creates or references an IBM Cloud resource group. Can be configured to either create a new group or use an existing one. |
| `route` | Manages a VPC route. |
| `security_group` | Creates a security group and manages its ingress and egress rules for TCP, UDP, and ICMP. |
| `subnet` | Creates a VPC subnet and its corresponding address prefix. |
| `tg_gateway` | Manages a Transit Gateway. |
| `tg_gw_conn` | Manages a Transit Gateway connection. |
| `volume` | Creates a block storage volume. |
| `volume_attachment`| Attaches a block storage volume to a VSI. |
| `vpc` | Provisions a Virtual Private Cloud (VPC). |
| `vsi` | Provisions one or more Virtual Server Instances (VSIs) with flexible naming conventions and optional data volumes. |

