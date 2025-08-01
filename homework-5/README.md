### Example of file 'terraform.tfvars' for Oregon region


```hcl
# Choose region where to create VPC:
region = "us-east-2"

# Create name tags for created objects:
environment = "Alexander"

# Choose CIDR block for created VPC:
vpc_cidr = "10.0.0.0/16"

# Choose CIDR blocks for subnets:
subnet = ["10.0.0.0/27", "10.0.0.32/27", "10.0.0.64/27"]

# Pick instance type and AMI for created instances:
ec2_info = {ami_id = "ami-08ca1d1e465fbfe0c", instance_type = "t2.micro"}
```
