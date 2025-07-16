resource "aws_vpc" "homework_vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true
  region = "us-west-2"
  
  tags = {
    Name = "kaizen"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.homework_vpc.id

  tags = {
    Name = "igw-homework"
  }
}