provider "aws" {
  access_key = "AKIAJJXTEEB7JS6LQNQQ"
  secret_key = "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"
  region = "eu-west-3"
}

#Specify details of the ec2 instance 
resource "aws_instance" "instance_onestic" {
ami = "ami-00f6fe7d6cbb56a78" #eu-west-3 focal 20.04 LTS amd64
instance_type = "t2.micro"
tags = {
Name = "ubuntu-20.04"
}
}
