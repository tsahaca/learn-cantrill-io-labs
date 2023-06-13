output "vpc_private_subnet_cidr" {
  description = "VPC private subnet CIDR"
  value       = module.vpc.private_subnets_cidr_blocks
}

output "vpc_public_subnet_cidr" {
  description = "VPC public subnet CIDR"
  value       = module.vpc.public_subnets_cidr_blocks
}

output "vpc_cidr" {
  description = "VPC CIDR"
  value       = module.vpc.vpc_cidr_block
}

output "iam_role_arn" {
  description = "ARN of IAM role"
  value       = module.ec2_instance_role.iam_role_arn
}

output "iam_role_name" {
  description = "Name of IAM role"
  value       = module.ec2_instance_role.iam_role_name
}

output "iam_instance_profile_id" {
  description = "IAM Instance profile's ID."
  value       = module.ec2_instance_role.iam_instance_profile_id
}

# Region used for Terratest
output "region" {
  description = "AWS region"
  value       = local.region
}
