locals {
  std_sg = { for sg in var.standard_sg : join(" ", compact([sg.name, "standard"])) => sg }

  rds_sg = flatten([for sg_type, sgs in var.security_groups_rds : sg_type == "standard" ? [for sg_name in sgs : aws_security_group.standard["${sg_name} standard"].id] : []])

  private_ec2_sg = flatten([for sg_type, sgs in var.security_groups_ec2_private : sg_type == "standard" ? [for sg_name in sgs : aws_security_group.standard["${sg_name} standard"].id] : []])

  elb_adminer_sg = flatten([for sg_type, sgs in var.security_groups_elb : sg_type == "standard" ? [for sg_name in sgs : aws_security_group.standard["${sg_name} standard"].id] : []])


  config_server = [

    {
      content = filebase64("${path.module}/config/server/docker-compose.yml")
      path    = "/etc/server/docker-compose.yml"
    }

  ]


}
