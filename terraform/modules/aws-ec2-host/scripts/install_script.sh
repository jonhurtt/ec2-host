#!/usr/bin/bash
#Installing AWS CLI v2
#Sourced from https://gist.github.com/ruanbekker/9cce7b88fb3076c5e15ba00a1fd0651c
sudo apt update
sudo apt install curl wget unzip -y
sudo curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
sudo unzip awscliv2.zip
sudo ./aws/install
touch ~/script_results.txt
docker --version >> ~/script_results.txt
aws --version >> ~/script_results.txt


#Installing JQ 
sudo apt install jq -y

echo "install_script.sh completed" >> ~/script_results.txt