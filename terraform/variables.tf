variable "region" {
  description = "AWS Region"
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Project Name for Tagging"
  type        = string
}

variable "environment_name" {
  description = "Environment Name for Tagging"
  type        = string
  default     = "Production"
}

variable "permit_http_IP" {
  description = "IP Address to access :8080"
  type        = string
}
