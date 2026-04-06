terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.39.0"
    }
  }
  backend "s3" {
    bucket = "demo-rohit-s3-backend"
    key    = "path/to/my/key"
    region = "ap-south-1"
    use_lockfile = true
  }
}

provider "aws" {
  # Configuration options
  region = "ap-south-1"
}

resource "aws_instance" "ec2_instance" {
  ami = "ami-05d2d839d4f73aafb"
  instance_type = "t3.micro"
  tags = {
    Name = "HelloWorld"
    
  }
}

output "aws_instance" {
  description = "Instance 0"
  value = aws_instance.ec2_instance.id

}