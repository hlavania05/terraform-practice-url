# Multi-Environment EC2 using Terraform Workspaces

This project deploys an EC2 instance on AWS using **Terraform workspaces** to manage multiple environments.

The same Terraform code is reused for different environments (dev, prod) with different instance types.

---

## What This Project Does

- Creates an EC2 instance on AWS
- Uses Terraform workspaces for environment separation
- Assigns instance type based on workspace
- Installs Apache using user_data
- Adds environment-based resource naming

---

## How It Works

Terraform checks the active workspace and selects the instance type accordingly:

```hcl
instance_type = lookup(var.instance_type, terraform.workspace)
```

---

## Terraform commands to run this script

terraform init

terraform workspace new dev
terraform workspace new prod

terraform workspace select dev
terraform apply

terraform workspace select prod
terraform apply


