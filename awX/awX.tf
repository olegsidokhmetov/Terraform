provider "aws" {
  access_key = "AKIAJJXTEEB7JS6LQNQQ"
  secret_key = "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"
  region = "eu-west-3"
}

resource "aws_security_group" "ubuntu" {
  name        = "ubuntu-security-group"
  description = "Allow HTTP, HTTPS and SSH traffic"

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

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

  tags = {
    Name = "terraform"
  }
}

#awX instance
resource "aws_instance" "awX" {
  ami           = "ami-00f6fe7d6cbb56a78" #eu-west-3 focal 20.04 LTS amd64
  instance_type = "t2.micro"
  key_name = "onestic-com"

  tags = {
    Name = "awX"
  }
  vpc_security_group_ids = [
    aws_security_group.ubuntu.id
  ]
}

#nginx instance
resource "aws_instance" "nginx" {
  ami           = "ami-00f6fe7d6cbb56a78" #eu-west-3 focal 20.04 LTS amd64
  instance_type = "t2.micro"
  key_name = "onestic-com"

  tags = {
    Name = "nginx"
  }
  vpc_security_group_ids = [
    aws_security_group.ubuntu.id
  ]
}
