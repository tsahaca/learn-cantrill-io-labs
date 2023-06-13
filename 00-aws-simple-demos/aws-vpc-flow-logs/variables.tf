variable "aws_region" {
  description = "AWS Region to be used"
  type        = string
  default     = "us-east-1"
}

variable "vpc_cidr" {
  description = "VPC CIDR to be used"
  type        = string
  default     = "10.0.0.0/16"
}

variable "vpc_name" {
  description = "Name of the VPC to be created"
  type        = string
  default     = "demo-vpc"
}

variable "project_name" {
  description = "Name of the Project"
  type        = string
  default     = "vpc-flow-logs"
}

variable "instance_types" { default = ["t2.micro"] }

variable tags  {
  type = map(string)
  default = {
    project = "vpc-flow-logs"
  }
}

