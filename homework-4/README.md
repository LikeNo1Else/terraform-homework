```hcl
# Example of file terraform.tfvars and possible input settings 
# Choose region whre create VPC
region = "us-west-2"

# Create name for key pair in region you choose
key_name = "my-homework-key"

# Create name for IGW for your VPC
igw_name = "homework-4-igw"

# Majot inputs for created VPC
vpc = [{cidr = "10.0.0.0/16", dns_hostnames = true, dns_support = true}]

# Create names for route tables in your VPC 
route_table = ["public-rt", "private-rt"]

# Choose wich ports should be open 
open_ports = [22, 80, 443, 3306]

# Pick right AMI and type for your instances based on your region
ec2_info = {
  ami_id_1         = "ami-0be5f59fbc80d980c"
  instance_type_1  = "t2.micro"
  ami_id_2         = "ami-0ec1bf4a8f92e7bd1"
  instance_type_2  = "t3.micro"
}

# Major settings for your subnets in created VPC
subnet = [
    {cidr = "10.0.0.0/27",  az = "us-west-2a", get_public_ip = true,  name = "public-subnet1"},
    {cidr = "10.0.0.32/27", az = "us-west-2b", get_public_ip = true,  name = "public-subnet2"},
    {cidr = "10.0.0.64/27", az = "us-west-2c", get_public_ip = false, name = "private-subnet1"},
    {cidr = "10.0.0.96/27", az = "us-west-2d", get_public_ip = false, name = "private-subnet2"},
]
