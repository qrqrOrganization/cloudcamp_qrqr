#!/bin/bash
sudo aws s3 cp s3://qrqr-config/default ./
sudo \mv -f default /etc/nginx/sites-available/default
sudo fuser -k 80/tcp

sudo systemctl start nginx
