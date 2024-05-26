variable "aws_region" {
  description = "AWS Region"
  type = string
}
variable "rds_instance_identifier" {
  description = "RDS instance identifier"
  type = string
}

variable "s3_bucket_name" {
  description = "S3 bucket name"
  type = string
}
variable "sqs_queue_name" {
  description = "SQS queue name"
  type = string
}

variable "sftp_instance_id" {
  description = "SFTP instance ID"
  type = string
}