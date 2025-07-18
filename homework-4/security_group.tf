resource "aws_security_group" "allow_ports" {
  name        = "My-security-group"
  description = "Open inbound traffic for ports"
  vpc_id      =  aws_vpc.kaizen.id
  lifecycle {create_before_destroy = true}
  tags = local.alexander_tags
}


resource "aws_vpc_security_group_ingress_rule" "allow_in_1" {
  security_group_id = aws_security_group.allow_ports.id
  ip_protocol       = "tcp"
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = var.open_ports[0]
  to_port           = var.open_ports[0]
}
resource "aws_vpc_security_group_ingress_rule" "allow_in_2" {
  security_group_id = aws_security_group.allow_ports.id
  ip_protocol       = "tcp"
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = var.open_ports[1]
  to_port           = var.open_ports[1]
}
resource "aws_vpc_security_group_ingress_rule" "allow_in_3" {
  security_group_id = aws_security_group.allow_ports.id
  ip_protocol       = "tcp"
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = var.open_ports[2]
  to_port           = var.open_ports[2]
}
resource "aws_vpc_security_group_ingress_rule" "allow_in_4" {
  security_group_id = aws_security_group.allow_ports.id
  ip_protocol       = "tcp"
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = var.open_ports[3]
  to_port           = var.open_ports[3]
}


# Allow all outbound traffic
resource "aws_vpc_security_group_egress_rule" "allow_outbound" {
  security_group_id = aws_security_group.allow_ports.id
  ip_protocol    = "-1"
  cidr_ipv4      = "0.0.0.0/0"
  from_port      = var.open_ports[0]
  to_port        = var.open_ports[3]
}

