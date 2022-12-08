#!/bin/bash
sudo apt update -y
sudo apt -y install nginx
sudo systemctl restart nginx
