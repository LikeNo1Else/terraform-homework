# Create new subnets insdie default VPC in us-west-2
# Initialise default VPC for Terraform
data "aws_vpc" "default" {
  default = true
}


resource "aws_subnet" "subnet1" {
  vpc_id     = data.aws_vpc.default.id
  cidr_block = "172.31.64.0/20"
  availability_zone = "us-west-2a"
  map_public_ip_on_launch = true

  tags = {
    Name = "Main"
  }
}
resource "aws_subnet" "subnet2" {
  vpc_id     = data.aws_vpc.default.id
  cidr_block = "172.31.80.0/20"
  availability_zone = "us-west-2b"
  map_public_ip_on_launch = true

  tags = {
    Name = "Main"
  }
}
resource "aws_subnet" "subnet3" {
  cidr_block = "172.31.96.0/20"
  vpc_id     = data.aws_vpc.default.id
  availability_zone = "us-west-2c"
  map_public_ip_on_launch = true

  tags = {
    Name = "Main"
  }
}
