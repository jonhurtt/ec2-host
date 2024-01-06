# ec2-host
EC2 Host Deployed with AWS CLI

Used In:
- [EC2 Host with Docker](https://github.com/jonhurtt/ec2-docker-host)
    - [EC2 Host with Docker for Registry Scanning](https://github.com/jonhurtt/ec2-registry-scanner)
    - [EC2 Host with Docker and Vulnerables Apps (Code to Cloud Demo)](https://github.com/jonhurtt/code-to-cloud-demo)
## Process
```
cd terraform/
```

## Build Terraform, Output will provide SSH command
```
./_build.sh
```

## Validate Sucessful Execuation of Install Script via SSH
```
more results.txt
```

## Confirm AWS CLI via SSH
```
aws --version
```

## Destroy Environment
```
./_destroy.sh
```