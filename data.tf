data "aws_autoscaling_group" "web_server_asg" {
  name = module.webserver.web_server_asg_name
}

data "aws_instances" "web_server_instances" {
  filter {
    name   = "instance.group-id"
    values = [data.aws_autoscaling_group.web_server_asg.id]
  }
}