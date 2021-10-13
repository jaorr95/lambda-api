resource "aws_instance" "private_instance" {
  count                       = var.private_instance_quantity
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = var.private_instance_type
  associate_public_ip_address = false
  subnet_id                   = element(compact(module.vpc.private_subnets), count.index)
  vpc_security_group_ids      = local.private_ec2_sg
  user_data                   = templatefile("${path.module}/config/ec2/user-data.tpl", { config_server = local.config_server })

  tags = {
    Name = "${var.private_instance_prefix_name}${count.index + 1}"
  }

}