resource "aws_security_group" "allow_ports" {
  name        = "allow_ports"
  description = "Open inbound traffic for ports 22 and 80"
  vpc_id      =  aws_vpc.kaizen.id

  tags = {
    Name = "open_ports_22_80"
  }
  lifecycle {
    create_before_destroy = true
  }
}

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


# Allow outbound traffic
resource "aws_vpc_security_group_egress_rule" "allow_out_22" {
  security_group_id = aws_security_group.allow_ports.id
  from_port   = 0
  to_port     = 0
  ip_protocol    = "-1"
  cidr_ipv4 = "0.0.0.0/0"
}

