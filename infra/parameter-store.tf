resource "aws_ssm_parameter" "rds_uri" {
  name        = "/lahaus/dev/database/${var.dbname}/endpoint"
  description = "Endpoint to connect to the ${var.dbname} database"
  type        = "SecureString"
  value       = "${module.rds_aurora.rds_cluster_master_username}:${module.rds_aurora.rds_cluster_master_password}@${module.rds_aurora.rds_cluster_endpoint}"
}

resource "aws_ssm_parameter" "sg_rds" {
  name        = "/lahaus/dev/sg/ids"
  description = "Id of sg to access to rds ${var.dbname}"
  type        = "StringList"
  value       = join(",", local.rds_sg)
}

resource "aws_ssm_parameter" "private_subnets_id" {
  name        = "/lahaus/dev/vpc/${var.vpc_name}/private_subnets_id"
  description = "Id of privates subnets of vpc ${var.vpc_name}"
  type        = "StringList"
  value       = join(",", module.vpc.private_subnets)
}

resource "aws_ssm_parameter" "acm_arn" {
  name        = "/lahaus/acm/arn"
  description = "ARN of certificate"
  type        = "String"
  value       = module.acm.acm_certificate_arn
}