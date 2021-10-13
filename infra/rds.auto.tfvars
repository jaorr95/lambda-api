security_groups_rds = {
  standard = ["database access"]
}

dbname = "lahaus-postgresql"


rds_cluster_parameter_group_values = [
  {
    name  = "log_statement"
    value = "mod"
  },
  {
    name  = "log_min_duration_statement"
    value = "2500" #2.5seg
  }
]