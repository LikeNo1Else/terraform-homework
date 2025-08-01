provider aws {
  region = var.region
}

resource "aws_vpc" "kaizen" {
  cidr_block            = var.vpc_cidr
  enable_dns_support    = true
  enable_dns_hostnames  = true
  tags = {Name = "${var.environment}-vpc"}
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.kaizen.id
  tags = {Name = "${var.environment}-igw"}
}

resource "aws_subnet" "subnet1" {
  vpc_id                  = aws_vpc.kaizen.id
  cidr_block              = var.subnet[0]   
  availability_zone       = "${var.region}a"
  map_public_ip_on_launch = true
  tags = {Name = "${var.environment}-subnet1"}
}
resource "aws_subnet" "subnet2" {
  vpc_id                  = aws_vpc.kaizen.id
  cidr_block              = var.subnet[1]   
  availability_zone       = "${var.region}b"
  map_public_ip_on_launch = true
  tags = {Name = "${var.environment}-subnet2"}
}
resource "aws_subnet" "subnet3" {
  vpc_id                  = aws_vpc.kaizen.id
  cidr_block              = var.subnet[2]   
  availability_zone       = "${var.region}c"
  map_public_ip_on_launch = true
  tags = {Name = "${var.environment}-subnet3"}
}

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.kaizen.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {Name = "${var.environment}-public-rt"}
}

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
  route_table_id = aws_route_table.public_rt.id
}

output subnet1 {
  value = aws_subnet.subnet1.id
} 
output subnet2 {
  value = aws_subnet.subnet2.id
} 
output subnet3 {
  value = aws_subnet.subnet3.id
} 
