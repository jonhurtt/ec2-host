
#==================================================
# Defining Module for ec2_scanner
#==================================================
module "ec2_host" {
  source = "./modules/aws-ec2-host"
  project_name = var.project_name
  key_pair_name = "${var.project_name}_key_pair"
  permit_http_IP = var.permit_http_IP
  
  tags = {
    Name = "${var.project_name}_host"
    build_process = "terraform"
    environment =  var.environment_name
    project = var.project_name
  }
}