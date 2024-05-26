output "web_server_asg_name" {
  value = aws_autoscaling_group.web_server_asg.name
}

output "web_server_asg_instance" {
  value = aws_autoscaling_group.web_server_asg.id
}