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
  cidr_block = cidrsubnet(aws_vpc.development.cidr_block, 1, 1)
  vpc_id     = aws_vpc.development.id
  provider   = aws.east
  tags = {
    Name = "devsubnet1"
  }
}

resource "aws_security_group" "subnetsecurity" {
  vpc_id = aws_vpc.development.id

  ingress {
    cidr_blocks = [
      aws_vpc.development.cidr_block
    ]

    from_port = 80
    to_port   = 80
    protocol  = "tcp"
  }
}
