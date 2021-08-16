output "ec2_ip" {
  description = "Public IP of the EC2 instance."
  value       = module.ec2.public_ip[0]
}
