
variable "aws_region" {
  type        = string
  description = "The AWS region to deploy the resources in"
}

variable "cidr_blocks_for_vpc" {
  type        = string
  description = "CIDR block for the VPC (e.g., 10.1.0.0/16)"
}

variable "cidr_blocks_for_public_subnet" {
  type        = string
  description = "CIDR block for the public subnet (e.g., 10.1.1.0/24)"
}

variable "cidr_blocks_for_private_subnet" {
  type        = string
  description = "CIDR block for the private subnet (e.g., 10.1.2.0/24)"
}

variable "vpc_name" {
  type        = string
  description = "Tag name to assign to the VPC"
}

variable "ssh_cidr_blocks" {
  type        = list(string)
  description = "CIDR blocks allowed to SSH"
  default     = ["0.0.0.0/0"]
}

variable "http_cidr_blocks" {
  type        = list(string)
  description = "CIDR blocks allowed for HTTP"
  default     = ["0.0.0.0/0"]
}