module "security_group" {
  source              = "terraform-aws-modules/security-group/aws"
  version             = ">= 4.3.0"
  name                = "rearc_quest"
  description         = "Rearc quest security group."
  vpc_id              = var.vpc_id
  ingress_cidr_blocks = ["0.0.0.0/0"]
  ingress_rules       = ["ssh-tcp", "http-80-tcp", "https-443-tcp"]
  egress_rules        = ["all-all"]

  ingress_with_cidr_blocks = [{
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    description = "Rearc Express App"
    cidr_blocks = "0.0.0.0/0"
    }, {
    from_port   = 3030
    to_port     = 3030
    protocol    = "tcp"
    description = "Rearc Docker Container"
    cidr_blocks = "0.0.0.0/0"
  }]
}
