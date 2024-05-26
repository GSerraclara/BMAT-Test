# Create Launch Template
resource "aws_launch_template" "web_server" {
  name_prefix   = "web-server-"
  image_id      = data.aws_ami.std_ami.id
  instance_type = var.instance_type
  
  block_device_mappings {
    device_name = "/dev/xvda"
    ebs {
      volume_size = 8
    }
  }

  network_interfaces {
    associate_public_ip_address = true
    security_groups             = [aws_security_group.web_sg.id]
  }

  user_data = base64encode("${path.module}/user_data.sh")
}

# Create Auto Scaling Group
resource "aws_autoscaling_group" "web_server_asg" {
  desired_capacity     = 2
  max_size             = 3
  min_size             = 1
  
  vpc_zone_identifier = var.subnets
  
  # Attach Launch Template to Auto Scaling Group
  launch_template {
    id      = aws_launch_template.web_server.id
    version = "$Latest"
  }
  
  tag {
    key                 = "Name"
    value               = "web-server"
    propagate_at_launch = true
  }
}

# Create load Balancer
resource "aws_elb" "web_server" {
  name               = "web-server-elb"
  availability_zones = data.aws_availability_zones.available.names

  listener {
    instance_port     = 80
    instance_protocol = "HTTP"
    lb_port           = 80
    lb_protocol       = "HTTP"
  }

  health_check {
    target              = "HTTP:80/"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }

  tags = {
    Name = "web-server-elb"
  }
}

# Attaches a load balancer to an Auto Scaling group
resource "aws_autoscaling_attachment" "asg_attachment" {
  autoscaling_group_name = aws_autoscaling_group.web_server_asg.name
  elb                    = aws_elb.web_server.id
}
