# GLOBAL

variable "region" {
  type        = string
  description = "Region where resources will be created"

}

variable "azs" {
  type        = list
  description = "Availability zones where resources will be created"

}

variable "zone_id" {
  type = string
  description ="Zone id of jesus-lahaus.tk"
  default = "Z02306371M266I23H1YQ4"
}

variable "domain_name" {
  type = string
  description ="Domain name for test"
  default = "jesus-lahaus.tk"
}



variable "global_tags" {
  type        = map
  description = "Tags applied to all resources"
  default     = {}
}

# VPC

variable "vpc_name" {
  type        = string
  description = "Name of vpc"
  default     = "vpc-lahaus"

}

variable "vpc_cidr" {
  type        = string
  description = "CIDR of vpc"
  default     = "10.0.0.0/16"

}

variable "vpc_public_subnet_bitmask" {
  type        = number
  description = "Public subnet bitmask"
  default     = 8

}

variable "vpc_public_subnet_start" {
  type        = number
  description = "Public subnet start ip"
  default     = 1

}

variable "vpc_private_subnet_bitmask" {
  type        = number
  description = "Private subnet start ip"
  default     = 8

}

variable "vpc_private_subnet_start" {
  type        = number
  description = "Private subnet start ip"
  default     = 50

}

variable "vpc_database_subnet_bitmask" {
  type        = number
  description = "Database subnet start ip"
  default     = 8

}

variable "vpc_database_subnet_start" {
  type        = number
  description = "Database subnet start ip"
  default     = 100

}

variable "enable_nat_gateway" {
  type        = bool
  description = "Whether create nat gateway"
  default     = true

}

variable "single_nat_gateway" {
  type        = bool
  description = "Whether create only one nat gateway"
  default     = true

}

variable "one_nat_gateway_per_az" {
  type        = bool
  description = "Whether create one nat gateway per availability zone"
  default     = false

}


variable "vpc_tags" {
  type        = map
  description = "Tags applied to vpc resource"
  default     = {}
}

# SECURITY GROUPS

variable "sg_tags" {
  type        = map
  description = "Tags applied to security groups  resources"
  default     = {}
}


variable "standard_sg" {
  type        = any
  description = "Security grups standard (it does not depends of any other securuy group)"
  default     = []
}

variable "sg_default_egress" {
  type        = any
  description = "Default egress for segurity groups"
  default = {
    description      = "Default egress"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
    prefix_list_ids  = []
    security_groups  = null
    self             = null
  }
}


# RDS

variable "security_groups_rds" {
  type        = map
  description = "Association of security groups"
  default = {
    standard = []
  }
}

variable "dbname" {
  type        = string
  description = "Database name"

}

variable "rds_engine" {
  type        = string
  description = "Engine of rds aurora"
  default     = "aurora-postgresql"
}

variable "rds_engine_mode" {
  type        = string
  description = "Engine mode of rds aurora"
  default     = "serverless"
}

variable "rds_storage_encrypted" {
  type        = bool
  description = "Wether enable storage encrypted"
  default     = true
}


variable "rds_create_security_group" {
  type        = bool
  description = "Whether create default security group"
  default     = false
}

variable "rds_replica_scale_enabled" {
  type        = bool
  description = "Whether create read replicas"
  default     = false
}

variable "rds_replica_count" {
  type        = number
  description = "Quantity of read replicas to create"
  default     = 0
}


variable "rds_apply_immediately" {
  type        = bool
  description = "Whether apply change inmediately or during window maintainance"
  default     = true
}

variable "rds_skip_final_snapshot" {
  type        = bool
  description = "Whether skip final snapshot"
  default     = true
}

variable "rds_scaling_configuration" {
  type        = any
  description = "Configuration of scaling"
  default = {
    auto_pause   = false
    min_capacity = 2
    max_capacity = 2
  }
}


variable "rds_parameter_group_family" {
  type        = string
  description = "Family of rds to apply paremeters group"
  default     = "aurora-postgresql10"
}

variable "rds_cluster_parameter_group_values" {
  type        = list
  description = "Config values for cluster parameter group"
  default     = []
}

variable "rds_tags" {
  type        = map
  description = "Tags applied to rds resources"
  default     = {}
}


# EC2

variable "security_groups_ec2_private" {
  type        = map
  description = "Association of security groups"
  default = {
    standard = []
  }
}

variable "private_instance_quantity" {
  type        = number
  description = "Number of private instances"
  default     = 1
}

variable "private_instance_type" {
  type        = string
  description = "Instance type of private instances "
  default     = "t2.micro"
}

variable "private_instance_prefix_name" {
  type        = string
  description = "Prefix name for private instance"
  default     = "private-"
}

#ELB

variable "security_groups_elb" {
  type        = map
  description = "Association of security groups"
  default = {
    standard = []
  }
}

variable "elb_name" {
  type        = string
  description = "Name of elb"
}

