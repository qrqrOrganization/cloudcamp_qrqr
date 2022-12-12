#!/bin/bash
sudo aws s3 cp s3://qrqr-config/default ./
sudo \mv -f default /etc/nginx/sites-available/default

sudo apt purge libnginx-mod-http-perl

sudo systemctl restart nginx
