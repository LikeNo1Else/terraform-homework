## Example

```hcl
region = "us-east-2"
vpc_cidr = "10.0.0.0/16"
environment = "Alexander"
subnet = ["10.0.0.0/27", "10.0.0.32/27", "10.0.0.64/27"]
ec2_info = {
  ami_id         = "ami-08ca1d1e465fbfe0c"
  instance_type  = "t2.micro"
}
```