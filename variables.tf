variable "aws_region" {
  description = "AWS Region"
  default = "eu-west-3"
}

variable "db_username" {
  description = "Database username"
  default = "admin"
}

variable "db_password" {
  description = "Database password"
  default = "password"
}

variable "db_name" {
  description = "Database name"
  default = "mydb"
}

variable "sqs_queue_name" {
  description = "Name of the SQS queue"
  default = "bmat-sqs-queue"
}