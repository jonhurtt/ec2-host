#!/bin/bash
spacer="================================================================"
project_name="ec2"

echo $spacer
echo "Start"
echo $spacer
echo "Obtaining External IP Address"
IP=$(curl  -s https://ipinfo.io/ip)
echo "External: " ${IP}
echo $spacer
echo "Terraform Destory"
echo $spacer
terraform destroy --auto-approve -var project_name=$project_name -var permit_http_IP=$IP/32
echo $spacer
echo "Removing Key Pair"
echo $spacer
rm ./modules/aws-ec2-host/.ssh/*
echo $spacer
echo "Finish"
echo $spacer