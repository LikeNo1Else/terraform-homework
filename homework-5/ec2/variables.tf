variable region {}
variable environment {}
variable subnet {}
variable ec2_info {
  description = "Choose AMI and instance types"
  type = map(string)
  default = {
      ami_id = ""
      instance_type = ""
  }
}