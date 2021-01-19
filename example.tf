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
  region  = "us-west-2"
}
resource "aws_instance" "example" {
  ami           = "ami-830c94e3"
  instance_type = var.instance_type
}

variable "instance_type" {
  type = string
  default = "t2.micro"
}