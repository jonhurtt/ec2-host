#!/usr/bin/bash
spacer="================================================================"

#Installing AWS CLI v2
#Sourced from https://gist.github.com/ruanbekker/9cce7b88fb3076c5e15ba00a1fd0651c
echo $spacer
echo $spacer
echo "Installing AWS CLI v2"
echo $spacer
echo $spacer

sudo apt -qq update
sudo apt install -qq -y curl wget unzip
sudo curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
sudo unzip -qq awscliv2.zip
sudo ./aws/install
touch ~/script_results.txt
docker --version >> ~/script_results.txt
aws --version >> ~/script_results.txt

#Installing JQ 
echo $spacer
echo $spacer
echo "Installing JQ"
echo $spacer
echo $spacer
sudo apt -qq install jq -y

#Reporting Completion
echo "install_script.sh completed" >> ~/script_results.txt