#!/bin/bash
sudo apt update -y
sudo apt-get install build-essential checkinstall
sudo apt-get install libreadline-gplv2-dev libncursesw5-dev libssl-dev \
    libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev libffi-dev zlib1g-dev

cd /opt
sudo wget https://www.python.org/ftp/python/3.9.1/Python-3.9.1.tgz
sudo tar xzf Python-3.9.1.tgz

cd Python-3.9.1
sudo ./configure --enable-optimizations
sudo make altinstall

sudo python3.9 -m pip install --upgrade pip

cd /home/ubuntu/code_pipeline/qrqr_backend
pip3.9 install -r requirements.txt

sudo apt install awscli

sudo aws s3 cp s3://qrqr-config/secret.json ./

gunicorn --bind=0.0.0.0:8000 config.wsgi:application --daemon