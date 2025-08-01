provider aws {
  region = var.region
}

resource "aws_instance" "instance" {
  ami = var.ec2_info["ami_id"]
  instance_type = var.ec2_info["instance_type"]
  subnet_id = var.subnet
  tags = {Name = "${var.environment}-instance"}
}