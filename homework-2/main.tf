# Add key
resource "aws_key_pair" "bastion" {
  key_name   = "bastion-key"
  public_key = file("~/.ssh/id_rsa.pub")
}

# Launch instances
resource "aws_instance" "web1" {
  ami           = "ami-0ec1bf4a8f92e7bd1"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.subnet1.id 
  key_name = aws_key_pair.bastion.key_name 
  vpc_security_group_ids = [aws_security_group.allow_ports.id]
  user_data = file("apache_image.sh")
  
  tags = {
    Name = "Web-1"
  }
}
resource "aws_instance" "web2" {
  ami           = "ami-0ec1bf4a8f92e7bd1"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.subnet2.id 
  key_name = aws_key_pair.bastion.key_name 
  vpc_security_group_ids = [aws_security_group.allow_ports.id]
  user_data = file("apache_image.sh")
  
  tags = {
    Name = "Web-2"
  }
}
resource "aws_instance" "web3" {
  ami           = "ami-0ec1bf4a8f92e7bd1"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.subnet3.id 
  key_name = aws_key_pair.bastion.key_name 
  vpc_security_group_ids = [aws_security_group.allow_ports.id]
  user_data = file("apache_image.sh")
  
  tags = {
    Name = "Web-3"
  }
}


