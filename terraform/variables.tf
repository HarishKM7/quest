variable "aws_region" {
  description = "AWS region code where this infra is deployed."
}

variable "vpc_id" {
  description = "ID of the VPC where this infra is deployed."
}
variable "public_subnet_1" {
  description = "A public subnet for the EC2 instance."
}

variable "ec2_instance_type" {
  description = "EC2 instance type."
}
variable "amazon_linux_64_bit_ami" {
  description = "AMI ID of Amazon Linux 64-bit in this region."
}
