resource "tls_private_key" "tls_key" {
  algorithm = "RSA"
}

module "key_pair" {
  source     = "terraform-aws-modules/key-pair/aws"
  version    = ">= 1.0.0"
  key_name   = "rearc-quest"
  public_key = tls_private_key.tls_key.public_key_openssh
}

module "secrets_manager" {
  source = "lgallard/secrets-manager/aws"
  secrets = [{
    name          = "rearc-quest-private-key"
    secret_string = tls_private_key.tls_key.private_key_pem
  }]
}
