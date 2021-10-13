resource "aws_elb" "adminer" {
  name            = var.elb_name
  subnets         = module.vpc.public_subnets
  security_groups = local.elb_adminer_sg


  listener {
    instance_port      = 8080
    instance_protocol  = "http"
    lb_port            = 443
    lb_protocol        = "https"
    ssl_certificate_id = module.acm.acm_certificate_arn

  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 5
    timeout             = 25
    target              = "HTTP:8080/"
    interval            = 30
  }


  instances                   = aws_instance.private_instance.*.id
  cross_zone_load_balancing   = true
  idle_timeout                = 400
  connection_draining         = true
  connection_draining_timeout = 400

}