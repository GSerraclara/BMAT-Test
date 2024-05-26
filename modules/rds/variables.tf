variable "db_username" {
  description = "Database username"
  type = string
}

variable "db_password" {
  description = "Database password"
  type = string
}

variable "db_name" {
  description = "Database name"
  type = string
}

variable "vpc_id" {
  description = "VPC ID for the RDS instance"
  type = string
}

variable "subnets" {
  description = "Subnets for the RDS instance"
  type = list(string)
}