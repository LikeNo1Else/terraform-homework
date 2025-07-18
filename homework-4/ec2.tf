resource "aws_instance" "instance1" {
  ami = var.ec2_info["ami_id_1"]
  instance_type = var.ec2_info["instance_type_1"]
  subnet_id = aws_subnet.subnet1.id
  vpc_security_group_ids = [aws_security_group.allow_ports.id]
  tags = local.alexander_tags
}

resource "aws_instance" "instance2" {
  ami = var.ec2_info["ami_id_2"]
  instance_type = var.ec2_info["instance_type_2"]
  subnet_id = aws_subnet.subnet2.id
  vpc_security_group_ids = [aws_security_group.allow_ports.id]
  tags = local.alexander_tags
}

