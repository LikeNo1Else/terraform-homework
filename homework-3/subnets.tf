resource "aws_subnet" "public1" {
  vpc_id                  = aws_vpc.kaizen.id
  cidr_block              = "10.0.0.0/27"   
  availability_zone       = "us-west-2a"
  map_public_ip_on_launch = true

  tags = {
    Name = "public1"
  }
}

resource "aws_subnet" "public2" {
  vpc_id                  = aws_vpc.kaizen.id
  cidr_block              = "10.0.0.32/27"  
  availability_zone       = "us-west-2b"
  map_public_ip_on_launch = true

  tags = {
    Name = "public2"
  }
}

resource "aws_subnet" "private1" {
  vpc_id                  = aws_vpc.kaizen.id
  cidr_block              = "10.0.0.64/27"
  availability_zone       = "us-west-2c"
  map_public_ip_on_launch = false

  tags = {
    Name = "private1"
  }
}

resource "aws_subnet" "private2" {
  vpc_id                  = aws_vpc.kaizen.id
  cidr_block              = "10.0.0.96/27"
  availability_zone       = "us-west-2d"
  map_public_ip_on_launch = false

  tags = {
    Name = "private2"
  }
}


