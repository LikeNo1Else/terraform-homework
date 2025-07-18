variable region {
    description = "Choose region for your aws host"
    default = "us-west-2"
    type = string
}

variable key_name{
    description = "Provide name for your key in choosen region"
    default = "key-name"
    type = string
}

variable igw_name{
    description = "Provide name for your IGW"
    default = "homework-igw"
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
    type = list(object(
      {
        cidr = string
        az = string 
        get_public_ip = bool
        name = string
      }
    ))
}

variable ami_id {
  description = "AMI"
  type = map(string)
  default = {
      ami_id = "ami-05ffe3c48a9991133"
      instance_type = "t2.micro"
      subnet_id = "subnet-0d355a9acf56f88a6"
  }
  
}

