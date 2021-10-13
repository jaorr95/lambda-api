module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.7.0"


  name = var.vpc_name
  cidr = var.vpc_cidr

  azs              = var.azs
  private_subnets  = [for index in range(length(compact(var.azs))) : cidrsubnet(var.vpc_cidr, var.vpc_private_subnet_bitmask, var.vpc_private_subnet_start + index)]
  public_subnets   = [for index in range(length(compact(var.azs))) : cidrsubnet(var.vpc_cidr, var.vpc_public_subnet_bitmask, var.vpc_public_subnet_start + index)]
  database_subnets = [for index in range(length(compact(var.azs))) : cidrsubnet(var.vpc_cidr, var.vpc_database_subnet_bitmask, var.vpc_database_subnet_start + index)]


  enable_nat_gateway     = var.enable_nat_gateway
  single_nat_gateway     = var.single_nat_gateway
  one_nat_gateway_per_az = var.one_nat_gateway_per_az

  tags = merge(var.global_tags, var.vpc_tags)
}