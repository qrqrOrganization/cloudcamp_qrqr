#!/bin/bash
sudo dpkg --configure -a
sudo apt update -y
sudo apt -y install nginx

aws s3 cp s3://qrqr-config/default ./
sudo \mv -f default /etc/nginx/sites-available/default

sudo systemctl restart nginx