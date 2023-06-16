# Create the Infrastructure with terraform

## Step 1 - Run the terraform script

This terraform script with create the following resources in AWS

1. Create a VPC with 3 public subnets and VPC Flow Logs to CloudWatch Log Group 
2. IAM Instance Profile Role (Demo-SSM-Role) with policy arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore 
3. Security Group with egress_rules = ["all-all"]
4. 2 EC2 instances with (#2 & #3)

```shell
terraform init
terraform plan
terraform apply -auto-approve
# terraform apply -target="module.vpc" -auto-approve
```

## Step 2 - Login to both instances

EC2 Console -> Select the Instance -> Connect

## Step 3 - Test Connectivity between the instances

On both of the instances shells run 
```shell
ip a
```
The IP on interface eth0 is the same private IPv4 that is shown in EC2 Console

Send a ping request from instance to other 

```shell
ping <ip of the other instance> -c 3 -W 1
```




