#!/bin/bash
sudo rm /var/lib/apt/lists/lock
sudo rm /var/cache/apt/archives/lock
sudo rm /var/lib/dpkg/lock*
sudo apt update -y
sudo apt -y install nginx

apt install awscli -y
aws s3 cp s3://qrqr-config/default ./
sudo \mv -f default /etc/nginx/sites-available/default

sudo systemctl restart nginx