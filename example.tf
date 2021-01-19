terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 2.70"
    }
  }
}
provider "aws" {
  profile = "default"
  region  = "us-east-1"
}

/*resource "aws_key_pair" "keyFromTerraform" {
  key_name   = "keyFromTerraform"
  public_key = file("DevOpsAutomationKeyTF.pem")
}*/

/*resource "aws_security_group" "allow_http" {
  name        = "allow_http"
  description = "Allow HTTP inbound traffic"
  vpc_id      = ""

  ingress {
    description = "TLS from VPC"
    from_port   = 0
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

  tags = {
    Name = "allow_http"
  }
}*/



resource "aws_instance" "instanceFromTerraform" {
  ami           = "ami-0be2609ba883822ec"
  instance_type = var.instance_type
  #security_groups = ["sg-a9cb348d"]
  #key_name      = aws_key_pair.keyFromTerraform.key_name
  user_data     = "${file("install_apache.sh")}"
  

}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}