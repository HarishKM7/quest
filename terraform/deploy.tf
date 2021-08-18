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

  provisioner "remote-exec" { script = "deploy.sh" }
}
