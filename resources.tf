// AWS resources
resource "aws_vpc" "development" {
  cidr_block           = var.aws_ip_cidr_range
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = {
    Name = "devnetwork"
  }
}

resource "aws_subnet" "subnet1" {
  cidr_block        = cidrsubnet(aws_vpc.development.cidr_block, 3, 1)
  vpc_id            = aws_vpc.development.id
  availability_zone = "us-east-1a"
  tags = {
    Name = "devsubnet1"
  }
}

resource "aws_security_group" "subnetsecurity" {
  vpc_id = aws_vpc.development.id

  ingress {
    cidr_blocks = [
      "0.0.0.0/0"
    ]

    from_port = var.http_port
    to_port   = var.http_port
    protocol  = "tcp"
  }
  tags = {
    Name = "HTTP ingress"
  }
}
