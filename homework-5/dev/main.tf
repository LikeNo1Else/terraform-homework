provider "aws" {
    region = var.region
}

module vpc {
  source      = "../vpc"
  region = var.region
  vpc_cidr    = var.vpc_cidr
  subnet = var.subnet
  environment = var.environment
}

module ec2_first {
  source      = "../ec2"
  region = var.region
  ec2_info    = var.ec2_info
  subnet = module.vpc.subnet1
  environment = "${var.environment}-first"
}
module ec2_second {
  source      = "../ec2"
  region = var.region
  ec2_info    = var.ec2_info
  subnet = module.vpc.subnet2
  environment = "${var.environment}-second"
}
module ec2_third {
  source      = "../ec2"
  region = var.region
  ec2_info    = var.ec2_info
  subnet = module.vpc.subnet3
  environment = "${var.environment}-third"
}