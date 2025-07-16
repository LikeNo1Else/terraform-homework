data "aws_ami" "amazon_ami" {
  most_recent = true
  owners = ["amazon"] 

  filter {
    name   = "name"
    values = ["al2023-ami-2023.8.20250707.0-kernel-6.1-x86_64"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }  
  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }
}

data "aws_ami" "ubuntu_ami" {
  most_recent = true
  owners      = ["amazon"] 

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }  
  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }
}

# Print AMI
output "amazon_linux_2023_ami_id" {
  value = data.aws_ami.amazon_ami.id
}
output "ubuntu_2204_ami_id" {
  value = data.aws_ami.ubuntu_ami.id
}

resource "aws_instance" "instance1" {
  ami = data.aws_ami.amazon_ami.id   
  instance_type = "t2.micro"
  subnet_id = aws_subnet.public1.id
  vpc_security_group_ids = [aws_security_group.allow_ports.id]
  user_data = file("apache_amazon.sh")

  tags = {
    Name = "Amazon-Apache"
  }
}
resource "aws_instance" "instance2" {
  ami = data.aws_ami.ubuntu_ami.id  
  instance_type = "t2.micro"
  subnet_id = aws_subnet.public2.id
  vpc_security_group_ids = [aws_security_group.allow_ports.id]
  user_data = file("apache_ubuntu.sh")

  tags = {
    Name = "Ubuntu-Apache"
  }
}

