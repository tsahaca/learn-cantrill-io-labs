# Create the Infrastructure with terraform

- Create a VPC with 3 public subnets and VPC Flow Logs to CloudWatch Log Group
- IAM Instance Profile Role with policy arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore
- Security Group with egress_rules = ["all-all"]
- 2 EC2 instances with (#2 & #3)

```shell
terraform apply -target="module.vpc" -auto-approve
```