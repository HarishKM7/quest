module "security_group" {
  source              = "terraform-aws-modules/security-group/aws"
  version             = ">= 4.3.0"
  name                = "rearc_quest"
  description         = "Rearc quest security group."
  vpc_id              = var.vpc_id
  ingress_cidr_blocks = ["0.0.0.0/0"]
  ingress_rules       = ["ssh-tcp", "http-80-tcp", "https-443-tcp"]
  egress_rules        = ["all-all"]
}
