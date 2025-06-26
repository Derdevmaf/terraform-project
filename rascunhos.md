terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1" # região da instância
  profile = "terraform-user-test22" # nome colocado no profile após o aws configure, access key id e secret access key
}

resource "aws_security_group" "allow_web" {
  name        = "allow_web_traffic2"
  description = "Allow Web inbound traffic2"

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "docker_instance" {
  ami           = "ami-020cba7c55df1f615"  #modelo ami da máquina
  instance_type = "t2.micro"

  security_groups = [aws_security_group.allow_web.name]

  tags = {
    Name = "Quarta tentativa"
  }
}

output "public_ip" {
  value = aws_instance.docker_instance.public_ip
}