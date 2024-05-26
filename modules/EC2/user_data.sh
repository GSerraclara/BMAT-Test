#!/bin/bash

# Update the system packages
yum update -y

# Install nginx web server
amazon-linux-extras install nginx1.12 -y

# Start the web server
systemctl start nginx

# Enable nginx to start on system boot
systemctl enable nginx
