 module "records" {
  source  = "terraform-aws-modules/route53/aws//modules/records"
  version = "~> 2.0"

  zone_id = var.zone_id

  records = [
    {
      name = "adminer"
      type = "A"
      alias = {
        name    = aws_elb.adminer.dns_name
        zone_id = aws_elb.adminer.zone_id
      }
    }
  ]
}