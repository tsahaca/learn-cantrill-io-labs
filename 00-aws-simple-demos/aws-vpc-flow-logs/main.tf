provider "aws" {
  region = local.region
}


data "aws_availability_zones" "available" {
  filter {
    name   = "opt-in-status"
    values = ["opt-in-not-required"]
  }
}

locals {
  vpc_name = var.vpc_name

  region   = var.aws_region
  vpc_cidr = var.vpc_cidr
  azs      = slice(data.aws_availability_zones.available.names, 0, 3)

  tags = var.tags
}



#---------------------------------------------------------------
# Supporting Resources
#---------------------------------------------------------------

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 5.0.0"

  name = local.vpc_name
  cidr = local.vpc_cidr

  azs             = local.azs
  public_subnets  = [for k, v in local.azs : cidrsubnet(local.vpc_cidr, 8, k)]
  private_subnets = [for k, v in local.azs : cidrsubnet(local.vpc_cidr, 8, k + 10)]

  enable_nat_gateway   = true
  single_nat_gateway   = true
  enable_dns_hostnames = true

  # Manage so we can name
  manage_default_network_acl    = true
  default_network_acl_tags      = { Name = "${local.vpc_name}-default" }
  manage_default_route_table    = true
  default_route_table_tags      = { Name = "${local.vpc_name}-default" }
  manage_default_security_group = true
  default_security_group_tags   = { Name = "${local.vpc_name}-default" }

  # Cloudwatch log group and IAM role will be created
  enable_flow_log                      = true
  create_flow_log_cloudwatch_log_group = true
  create_flow_log_cloudwatch_iam_role  = true

  flow_log_max_aggregation_interval         = 60
  flow_log_cloudwatch_log_group_name_prefix = "/aws/my-amazing-vpc-flow-logz/"
  flow_log_cloudwatch_log_group_name_suffix = "my-test"

  vpc_flow_log_tags = local.tags

  tags = local.tags
}

module "ec2_instance_role" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-assumable-role"
  version = "5.20.0"
  role_requires_mfa = false
  create_role = true
  create_instance_profile = true
  role_name         = "Demo-SSM-Role"

  trusted_role_services = [
    "ec2.amazonaws.com"
  ]

  custom_role_policy_arns = [
    "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
  ]
  #  number_of_custom_role_policy_arns = 3
  tags = local.tags
}
