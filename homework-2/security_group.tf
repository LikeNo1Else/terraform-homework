# Creating groups
resource "aws_security_group" "allow_ports" {
  name        = "allow_ports"
  description = "Open inbound traffic for ports"
  vpc_id      = data.aws_vpc.default.id

  tags = {
    Name = "open_ports_22_80_443_3306"
  }
  lifecycle {
    create_before_destroy = true
  }
}

# Allow inbound traffic
resource "aws_vpc_security_group_ingress_rule" "allow_in_22" {
  security_group_id = aws_security_group.allow_ports.id
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
  cidr_ipv4         = "0.0.0.0/0"
}
resource "aws_vpc_security_group_ingress_rule" "allow_in_80" {
  security_group_id = aws_security_group.allow_ports.id
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
  cidr_ipv4         = "0.0.0.0/0"
}
resource "aws_vpc_security_group_ingress_rule" "allow_in_443" {
  security_group_id = aws_security_group.allow_ports.id
  from_port         = 443
  ip_protocol       = "tcp"
  to_port           = 443
  cidr_ipv4         = "0.0.0.0/0"
}
resource "aws_vpc_security_group_ingress_rule" "allow_in_3306" {
  security_group_id = aws_security_group.allow_ports.id
  from_port         = 3306
  ip_protocol       = "tcp"
  to_port           = 3306
  cidr_ipv4         = "0.0.0.0/0"
}

# Allow outbound traffic
resource "aws_vpc_security_group_egress_rule" "allow_out_22" {
  security_group_id = aws_security_group.allow_ports.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "tcp" 
  from_port         = 22
  to_port           = 22
}
resource "aws_vpc_security_group_egress_rule" "allow_out_80" {
  security_group_id = aws_security_group.allow_ports.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "tcp" 
  from_port         = 80
  to_port           = 80
}
resource "aws_vpc_security_group_egress_rule" "allow_out_443" {
  security_group_id = aws_security_group.allow_ports.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "tcp" 
  from_port         = 443
  to_port           = 443
}
resource "aws_vpc_security_group_egress_rule" "allow_out_3306" {
  security_group_id = aws_security_group.allow_ports.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "tcp" 
  from_port         = 3306
  to_port           = 3306
}


