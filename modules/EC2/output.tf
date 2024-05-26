output "instance_ids" {
  value = aws_autoscaling_group.web_server_asg.id
}

output "web_server_asg_name" {
  value = aws_autoscaling_group.web_server_asg.name
}

output "autoscaling_group_instance" {
  value = aws_autoscaling_group.web_server_asg.id
}