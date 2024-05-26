variable "vpc_id" {
  description = "VPC ID for the RDS instance"
  type = string
}

variable "subnets" {
  description = "Subnets for the RDS instance"
  type = list(string)
}

variable "sqs_queue_url" {
  description = "URL of the SQS queue"
  type = string
}

variable "sqs_queue_arn" {
  description = "ARN of the SQS queue"
  type = string
}