#!/bin/bash
sudo apt update -y
sudo apt -y install nginx

sudo wget https://qrqr-static.s3.ap-northeast-2.amazonaws.com/default
sudo \mv -f default /etc/nginx/sites-available/default

sudo systemctl restart nginx
