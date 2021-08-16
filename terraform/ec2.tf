module "ec2" {
  source                      = "terraform-aws-modules/ec2-instance/aws"
  version                     = ">= 2.19.0"
  name                        = "rearc-quest"
  instance_count              = 1
  ami                         = var.amazon_linux_64_bit_ami
  instance_type               = var.ec2_instance_type
  key_name                    = module.key_pair.key_pair_key_name
  subnet_id                   = var.public_subnet_1
  user_data                   = file("ec2-user-data.sh")
  vpc_security_group_ids      = [module.security_group.security_group_id]
  associate_public_ip_address = true
}

resource "null_resource" "ec2" {
  triggers = { instance_id = module.ec2.id[0] }
  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = tls_private_key.tls_key.private_key_pem
    host        = module.ec2.public_dns[0]
  }
  provisioner "file" {
    source      = "../app"
    destination = "~/app"
  }
  provisioner "remote-exec" {
    inline = [
      "cd ~/app", "chmod +x bin/*", "npm install",
      "sudo mv ~/app/rearc.service /etc/systemd/system",
      "sudo systemctl daemon-reload",
      "sudo systemctl enable rearc",
      "sudo systemctl start rearc",
      "sleep 5"
    ]
  }
}
