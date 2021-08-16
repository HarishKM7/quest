output "ec2_private_key" {
  description = "Use this private key to SSH to the EC2 instance."
  value       = tls_private_key.tls_key.private_key_pem
  sensitive   = true
}
