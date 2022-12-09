#!/bin/bash
sudo apt update -y
sudo apt -y install nginx

suto apt install awscli
sudo aws s3 cp s3://qrqr-config/default ./
sudo \mv -f default /etc/nginx/sites-available/default

sudo systemctl restart nginx