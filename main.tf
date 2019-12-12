// After making changes to this file please run
// terraform init
// to rebuild these providers

provider "aws" {
  region = "us-east-1"
}

// AWS variables
variable "aws_ip_cidr_range" {
  type        = string
  default     = "10.0.1.0/24"
  description = "IP CIDR Range for AWS VPC"
}
