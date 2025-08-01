variable region {}
variable vpc_cidr {}
variable environment {}
variable subnet {
  description = "sybnet cidr"
  type        = list(string)
  default     = null
  nullable    = true
}
variable ec2_info {
  description = "Choose AMI and instance types"
  type = map(string)
  default = {
      ami_id = ""
      instance_type = ""
  }
}