#!/bin/bash
spacer="================================================================"
project_name="ec2"

echo $spacer
echo "Obtaining External IP Address"
IP=$(curl  -s https://ipinfo.io/ip)
echo "External: " ${IP}
echo $spacer
echo $spacer
echo "Start"
echo $spacer
echo "Generating new Key" 
echo $spacer
mkdir -p ./modules/aws-ec2-host/.ssh/
ssh-keygen -b 4096 -t rsa -f ./modules/aws-ec2-host/.ssh/${project_name}_key_pair -q -N ""
echo "Terraform Init"
echo $spacer
terraform init
echo $spacer
echo "Terraform Plan"
echo $spacer
terraform plan -out="tfplan.binary" -var project_name=$project_name -var permit_http_IP=$IP/32
echo $spacer
echo "Terraform Apply"
echo $spacer
terraform apply "tfplan.binary"
echo $spacer
echo $spacer
echo "SSH to EC2 Host for ${project_name}"
echo $spacer
cat terraform.tfstate | jq -r .outputs.ec2_ssh_public_dns.value
echo $spacer
echo $spacer
echo "Finish"
echo $spacer