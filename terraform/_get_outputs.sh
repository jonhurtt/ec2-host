#!/bin/bash
spacer="======================"
echo "Terraform Outputs"
echo $spacer
cat terraform.tfstate | jq -r .outputs
echo "Finish"
echo $spacer