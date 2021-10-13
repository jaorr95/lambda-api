standard_sg = [
  {
    name        = "database access"
    description = "allow database access"
    ingress = [{
      description      = "allow all traffic"
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
      prefix_list_ids  = []
      security_groups  = null
      self             = true
    }]
  },
  {
    name        = "adminer"
    description = "allow access for adminer"
    ingress = [{
      description      = "allow access for adminer"
      from_port        = 8080
      to_port          = 8080
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
      prefix_list_ids  = []
      security_groups  = null
      self             = false
    }]
  },
  {
    name        = "https"
    description = "allow access for https"
    ingress = [{
      description      = "allow access for https"
      from_port        = 443
      to_port          = 443
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
      prefix_list_ids  = []
      security_groups  = null
      self             = false
    }]
  }
]