#!/bin/bash

# sudo apt update -y
# sudo apt install software-properties-common -y
# sudo add-apt-repository ppa:deadsnakes/ppa
# sudo apt install python3.9

cd /home/ubuntu/code_pipeline/qrqr_backend
pip3.9 install -r requirements.txt
sudo aws s3 cp s3://qrqr-config/secret.json ./
sudo aws s3 cp ./static/* s3://qrqr-static/static/
gunicorn --bind=0.0.0.0:8000 config.wsgi:application --daemon
