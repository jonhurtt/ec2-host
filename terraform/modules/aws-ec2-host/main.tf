# Buildng EC2 Instance with Apache and changing default webpage
resource "aws_key_pair" "ssh_key" {
  key_name   = var.key_pair_name
  public_key = file("modules/aws-ec2-host/.ssh/${var.key_pair_name}.pub")
}


resource "aws_instance" "ec2_host" {
  ami                     = "ami-0fc5d935ebf8bc3bc" #Canonical, Ubuntu, 22.04 LTS, amd64 jammy image build on 2023-09-19
  
  instance_type           = "t2.micro"
  vpc_security_group_ids  = [aws_security_group.ec2_host_sg.id]
  key_name                = aws_key_pair.ssh_key.key_name
  
  tags = var.tags
  
  connection {
    user = "ubuntu"
    host = aws_instance.ec2_host.public_ip
    private_key = file("modules/aws-ec2-host/.ssh/${var.key_pair_name}")
  }

   provisioner "file" {
    source = "modules/aws-ec2-host/scripts/install_script.sh"
    destination = "/home/ubuntu/install_script.sh"
  }

  
  provisioner "remote-exec" {
    inline = [
      "chmod +x /home/ubuntu/install_script.sh",
      "/home/ubuntu/install_script.sh",
    ]
  }

  metadata_options {
    http_tokens = "required"
  }
}


resource "aws_security_group" "ec2_host_sg" {
  name = "${var.project_name}_sg"
  ingress {
    description = "Ingress for SSH for ${var.project_name}"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Egress for all TCP for ${var.project_name}"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.project_name}_sg"
  }
}