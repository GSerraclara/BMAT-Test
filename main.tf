module "network" {
  source = "./modules/network"
}

module "s3" {
  source = "./modules/s3"
}

module "rds" {
  source = "./modules/rds"
  vpc_id = module.network.vpc_id
  subnets = module.network.private_subnets
  db_username = var.db_username
  db_password = var.db_password
  db_name     = var.db_name
}

module "sftp" {
  source = "./modules/sftp"
}

module "webserver" {
  source  = "./modules/EC2"
  vpc_id = module.network.vpc_id
  subnets = module.network.public_subnets
}

module "sqs" {
  source = "./modules/sqs"
  sqs_queue_name = var.sqs_queue_name
}

module "lambda" {
  source = "./modules/lambda"
  vpc_id = module.network.vpc_id
  subnets = module.network.private_subnets
  sqs_queue_url = module.sqs.queue_url
  sqs_queue_arn = module.sqs.queue_arn
}

module "monitoring_alarm" {
  source = "./modules/monitoring/alarm"
  web_server_asg_name = module.webserver.web_server_asg_name
}

module "monitoring_dashboard" {
  source = "./modules/monitoring/dashboard"
  s3_bucket_name = module.s3.s3_bucket_name
  rds_instance_identifier = module.rds.rds_instance_identifier
  aws_region = var.aws_region
  sqs_queue_name = module.sqs.queue_name
  sftp_instance_id = module.sftp.sftp_instance_id
}
