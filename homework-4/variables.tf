variable region {
    description = "Choose region for your aws host"
    default = ""
    type = string
}

variable key_name{
    description = "Provide name for your key in choosen region"
    default = ""
    type = string
}

variable igw_name{
    description = "Provide name for your IGW"
    default = ""
    type = string
}

variable route_table {
   description = "Input names for route tables"
   type        = list(string)
   default     = null
   nullable    = true
}

variable open_ports {
  description = "Input numbers for ports to open"
  type        = list(number)
  default     = null
  nullable    = true
}

variable ec2_info {
  description = "Choose AMI and instance types"
  type = map(string)
  default = {
      ami_id_1 = ""
      instance_type_1 = ""
      ami_id_2 = ""
      instance_type_2 = ""
  }
}

variable vpc {
    description = "Inputs for: cidr block for VPC, enable dns support, enable dns hostnames"
    default = [{
        cidr = ""
        dns_support = false
        dns_hostnames = false
    }]
    type = list(object({
        cidr = string
        dns_support = bool
        dns_hostnames = bool        
    }))
}

variable subnet {
    description = "For subnet get: cidr block, availability zone, auto-assign public IP and name"
      type = list(object(
       {
        cidr = string
        az = string 
        get_public_ip = bool
        name = string
       }
     default = [
      {
        cidr = ""
        az = ""
        get_public_ip = false
        name = ""
      },
      {
        cidr = ""
        az = ""
        get_public_ip = false
        name = ""
      },
      {
        cidr = ""
        az = ""
        get_public_ip = false
        name = ""
      },
      {
        cidr = ""
        az = ""
        get_public_ip = false
        name = ""
      }     
    ]
    ))
}
