output "ssh_command_ip" {
  description = "SSH Command of EC2 Ubuntu Host Instance"
  value = "ssh -i modules/aws-ec2-host/.ssh/${var.key_pair_name} ubuntu@${aws_instance.ec2_host.public_ip}"
}

output "ssh_command_fqdn" {
  description = "SSH Command of EC2 Ubuntu Host Instance"
  value = "ssh -i modules/aws-ec2-host/.ssh/${var.key_pair_name} ubuntu@${aws_instance.ec2_host.public_dns}"
}

  