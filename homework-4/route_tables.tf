resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.kaizen.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.homework3_igw.id
  }

  tags = {
    Name = "public-rt"
  }
}
resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.kaizen.id
  
  tags = {
    Name = "private-rt"
  }
}

# Associate route tables to subnets
resource "aws_route_table_association" "rta_1" {
  subnet_id      = aws_subnet.public1.id
  route_table_id = aws_route_table.public_rt.id
}
resource "aws_route_table_association" "rta_2" {
  subnet_id      = aws_subnet.public2.id
  route_table_id = aws_route_table.public_rt.id
}
resource "aws_route_table_association" "rta_3" {
  subnet_id      = aws_subnet.private1.id
  route_table_id = aws_route_table.private_rt.id
}
resource "aws_route_table_association" "rta_4" {
  subnet_id      = aws_subnet.private2.id
  route_table_id = aws_route_table.private_rt.id
}
