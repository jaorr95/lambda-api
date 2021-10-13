resource "aws_security_group" "standard" {

  for_each = local.std_sg

  name        = each.value.name
  description = each.value.description
  vpc_id      = module.vpc.vpc_id

  ingress = each.value.ingress

  egress = [lookup(each.value, "egress", var.sg_default_egress)]

  tags = merge(var.global_tags, var.sg_tags, { Name = each.value.name })
}
