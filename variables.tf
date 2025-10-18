# AWS Region
variable "aws_region" {
  type        = string
  default     = "ap-south-1"
  description = "The AWS region where resources will be deployed"
}

# VPC CIDR
variable "vpc_cidr" {
  type        = string
  default     = "10.10.0.0/16"
  description = "The CIDR block for the VPC"
}

# Public Subnets
variable "public_subnets" {
  type        = list(string)
  default     = ["10.10.1.0/24", "10.10.2.0/24"]
  description = "List of public subnet CIDRs"

  validation {
    condition     = alltrue([for cidr in var.public_subnets : can(regex("^([0-9]{1,3}\\.){3}[0-9]{1,3}/[0-9]{1,2}$", cidr))])
    error_message = "Each public subnet must be a valid CIDR block (e.g., 10.10.1.0/24)"
  }
}

# Private Subnets
variable "private_subnets" {
  type        = list(string)
  default     = ["10.10.101.0/24", "10.10.102.0/24"]
  description = "List of private subnet CIDRs"

  validation {
    condition     = alltrue([for cidr in var.private_subnets : can(regex("^([0-9]{1,3}\\.){3}[0-9]{1,3}/[0-9]{1,2}$", cidr))])
    error_message = "Each private subnet must be a valid CIDR block (e.g., 10.10.101.0/24)"
  }
}

# Availability Zones
variable "availability_zones" {
  type        = list(string)
  default     = ["ap-south-1a", "ap-south-1b"]
  description = "List of availability zones to deploy subnets"
}

# Environment
variable "environment" {
  type        = string
  default     = "dev"
  description = "Deployment environment"

  validation {
    condition     = contains(["dev", "qa", "prod"], var.environment)
    error_message = "Environment must be one of 'dev', 'qa', or 'prod'."
  }
}

# Tags
variable "tags" {
  type        = map(string)
  default     = {
    Project = "aws-vpc-demo"
    Owner   = "PlatformTeam"
  }
  description = "Default tags to apply to all resources"
}
