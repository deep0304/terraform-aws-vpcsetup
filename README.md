# 🌐 Terraform AWS VPC Setup (Project-Level)

This project provisions a custom AWS Virtual Private Cloud (VPC) using **Terraform**. It includes networking essentials to support secure infrastructure deployments like EC2, ALBs, and other AWS services.

---

## ✨ Features

- Custom VPC with user-defined CIDR block
- Public and private subnets
- Internet Gateway (IGW)
- Route Table association
- Security Group for SSH/HTTP/HTTPS
- Clean modular structure with reusable components

---

## 🛠️ Usage

1. Clone the repository:
   ```bash
   git clone https://github.com/deep0304/terraform-aws-vpcsetup.git
   cd terraform-aws-vpcsetup
   ```

2. Edit `variables.tfvars` as per your configuration:
   ```hcl
   aws_region                     = "us-east-1"
   access_key                     = "your-access-key"
   secret_key                     = "your-secret-key"
   cidr_blocks_for_vpc            = "10.1.0.0/16"
   cidr_blocks_for_public_subnet  = "10.1.1.0/24"
   cidr_blocks_for_private_subnet = "10.1.2.0/24"
   ```

3. Run Terraform:
   ```bash
   terraform init
   terraform plan -var-file="variables.tfvars"
   terraform apply -var-file="variables.tfvars"
   ```

---

## 📦 Example for using the module -"main.tf" 

```hcl
terraform {
  required_version = ">= 1.6.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

module "aws_vpcsetup" {
  source                          = "./terraform-aws-vpcsetup"
  aws_region                      = "us-east-1"
  access_key                      = "your-access-key"
  secret_key                      = "your-secret-key"
  cidr_blocks_for_vpc             = "10.1.0.0/16"
  cidr_blocks_for_public_subnet   = "10.1.1.0/24"
  cidr_blocks_for_private_subnet  = "10.1.2.0/24"
}

output "public_ip" {
  value = module.aws_working_instance.public_ip
}

output "vpc_id" {
  value = module.aws_vpcsetup.vpc_id
}

output "public_subnet_id" {
  value = module.aws_vpcsetup.public_subnet_id
}

output "security_group_id" {
  value = module.aws_vpcsetup.security_group_id
}
```

---

## 📁 Directory Structure

```
terraform-aws-vpcsetup/
│
├── main.tf
├── outputs.tf
├── routeTable.tf
├── securityGroup.tf
├── variables.tf
├── variables.example.tfvars
├── versions.tf
├── LICENSE
└── .gitignore
```

---

## 📜 License

Licensed under the [Apache License, Version 2.0](LICENSE).

