aws_region         = "ap-south-1"
vpc_cidr           = "10.10.0.0/16"
public_subnets     = ["10.10.1.0/24","10.10.2.0/24"]
private_subnets    = ["10.10.101.0/24","10.10.102.0/24"]
availability_zones = ["ap-south-1a","ap-south-1b"]
tags = {
  Environment = "dev"
  Project     = "aws-vpc-demo"
  Owner       = "PlatformTeam"
}

