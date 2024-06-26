# Create a VPC
resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
  enable_dns_hostnames = true
  tags = {
    name = "main"
  }
}
# Create public subnet
resource "aws_subnet" "public" {
    count = length(var.public_subnets)
    vpc_id = aws_vpc.main.id
    cidr_block = element(var.public_subnets, count.index)
    map_public_ip_on_launch = true
}
# Create private subnet
resource "aws_subnet" "private" {
    count = length(var.private_subnets)
    vpc_id = aws_vpc.main.id
    cidr_block = element(var.private_subnets, count.index)
}