#!/bin/bash
aws s3 cp s3://qrqr-config/default ./
sudo \mv -f default /etc/nginx/sites-available/default
systemctl restart nginx
