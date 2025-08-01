resource "aws_vpc" "kaizen" {
  cidr_block            = var.vpc[0].cidr
  enable_dns_support    = var.vpc[0].dns_support
  enable_dns_hostnames  = var.vpc[0].dns_hostnames
  tags = local.alexander_tags
}

resource "aws_key_pair" "bastion" {
  key_name   = var.key_name
  public_key = file("~/.ssh/id_rsa.pub")
  tags = local.alexander_tags
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.kaizen.id
  tags = {
    Name = var.igw_name
  }
}

