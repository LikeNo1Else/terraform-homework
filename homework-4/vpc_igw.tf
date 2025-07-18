resource "aws_vpc" "kaizen" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "kaizen"
  }
}

resource "aws_internet_gateway" "homework3_igw" {
  vpc_id = aws_vpc.kaizen.id

  tags = {
    Name = "homework3_igw"
  }
}