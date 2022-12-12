#!/bin/bash
if [ -d /home/ubuntu/code_pipeline_nginx ]; then
    sudo rm -rf /home/ubuntu/code_pipeline_nginx
fi
sudo mkdir -vp /home/ubuntu/code_pipeline_nginx