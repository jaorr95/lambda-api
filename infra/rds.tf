module "rds_aurora" {
  source  = "terraform-aws-modules/rds-aurora/aws"
  version = "5.2.0"

  name              = var.dbname
  engine            = var.rds_engine
  engine_mode       = var.rds_engine_mode
  storage_encrypted = var.rds_storage_encrypted

  vpc_id                = module.vpc.vpc_id
  subnets               = module.vpc.database_subnets
  create_security_group = var.rds_create_security_group

  replica_scale_enabled = var.rds_replica_scale_enabled
  replica_count         = var.rds_replica_count

  vpc_security_group_ids = local.rds_sg

  apply_immediately   = var.rds_apply_immediately
  skip_final_snapshot = var.rds_skip_final_snapshot

  db_cluster_parameter_group_name = aws_rds_cluster_parameter_group.this.id
  scaling_configuration           = var.rds_scaling_configuration


}

resource "aws_rds_cluster_parameter_group" "this" {
  name        = "${var.dbname}-${var.rds_engine}-${var.rds_engine_mode}-cluster-parameter-group"
  family      = var.rds_parameter_group_family
  description = "${var.dbname}-${var.rds_engine}-${var.rds_engine_mode}-cluster-parameter-group"

  dynamic "parameter" {
    for_each = var.rds_cluster_parameter_group_values

    content {
      name  = parameter.value.name
      value = parameter.value.value
    }
  }
  tags = merge(var.global_tags, var.rds_tags)
}


