variable "tags" {
  description = "Tags to set on the ec2 instance."
  type        = map(string)
  default     = {}
}

variable "project_name" {
  description = "Used for Naming convention for EC2 Host"
  type = string
}

variable "key_pair_name" {
  description = "Used for Naming convention for EC2 Host"
  type = string
}

variable "permit_http_IP" {
  description = "IP Address to access 8080"
  type        = string
}
