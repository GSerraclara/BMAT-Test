variable "vpc_id" {
  description = "VPC ID"
  type = string
}
variable "subnets" {
  description = "Subnets for the Auto Scaling group"
  type = list(string)
}

variable "instance_type" {
  description = "EC2 instance type"
  type = string
  default = "t3.micro"
}