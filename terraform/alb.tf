module "alb" {
  source             = "terraform-aws-modules/alb/aws"
  version            = ">= 6.5.0"
  name               = "rearc-quest"
  load_balancer_type = "application"
  vpc_id             = var.vpc_id
  subnets            = [var.public_subnet_1, var.public_subnet_2]
  security_groups    = [module.security_group.security_group_id]

  target_groups = [{
    name_prefix      = "rearc-"
    backend_protocol = "HTTP"
    backend_port     = 3000
    target_type      = "instance"
    targets = [{
      target_id = module.ec2.id[0]
      port      = 3000
    }]
    }
  ]

  http_tcp_listeners = [{
    port               = 80
    protocol           = "HTTP"
    target_group_index = 0
  }]
}
