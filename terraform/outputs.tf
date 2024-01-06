#==================================================
# Output variable definitions
#==================================================
output "region" {
  description = "AWS Region"
  value       = var.region
}

output "ec2_ssh_public_ip" {
  description = "SSH to Host (IP)"
  value       = module.ec2_host.ssh_command_ip
}

output "ec2_ssh_public_dns" {
  description = "SSH to Host (FQDN)"
  value       = module.ec2_host.ssh_command_fqdn
}