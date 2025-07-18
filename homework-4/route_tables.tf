# Finding/initilising IGW by tag name provided in terraform.tfvars
data "aws_internet_gateway" "by_tag" {
  depends_on = [aws_internet_gateway.igw]
  filter {
    name   = "tag:Name"
    values = [var.igw_name]
  }
  filter {
    name   = "attachment.vpc-id"
    values = [aws_vpc.kaizen.id]
  }
}


resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.kaizen.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = data.aws_internet_gateway.by_tag.id
  }
  tags = {Name = var.route_table[0]}
}
resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.kaizen.id 
  tags = {Name = var.route_table[1]}
}


# Associate route tables to subnets
resource "aws_route_table_association" "rta_1" {
  subnet_id      = aws_subnet.subnet1.id
  route_table_id = aws_route_table.public_rt.id
}
resource "aws_route_table_association" "rta_2" {
  subnet_id      = aws_subnet.subnet2.id
  route_table_id = aws_route_table.public_rt.id
}
resource "aws_route_table_association" "rta_3" {
  subnet_id      = aws_subnet.subnet3.id
  route_table_id = aws_route_table.private_rt.id
}
resource "aws_route_table_association" "rta_4" {
  subnet_id      = aws_subnet.subnet4.id
  route_table_id = aws_route_table.private_rt.id
}
