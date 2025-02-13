module "ec2" {
  source                      = "terraform-aws-modules/ec2-instance/aws"
  version                     = ">= 2.19.0"
  name                        = "rearc-quest"
  instance_count              = 1
  ami                         = var.amazon_linux_64_bit_ami
  instance_type               = var.ec2_instance_type
  key_name                    = module.key_pair.key_pair_key_name
  subnet_id                   = var.public_subnet_1
  vpc_security_group_ids      = [module.security_group.security_group_id]
  associate_public_ip_address = true
}
