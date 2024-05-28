provider "aws" {
  region = "us-east-1"
  alias = "us-east-1"
}

provider "aws" {
  region = "ap-south-1"
  alias = "ap-south-1"
}

resource "aws_instance" "first_terraform_server" {
  instance_type = "t2.micro"
  ami = "ami-04b70fa74e45c3917"
  provider = aws.us-east-1
  key_name = "first instance"
  tags = {
    Name= "Terraform First Server"
  }
}

resource "aws_instance" "second_terraform_server" {
  instance_type = "t2.micro"
  ami = "ami-0f58b397bc5c1f2e8"
  provider = aws.ap-south-1
  tags = {
    Name= "Terraform Second Server"
  }
}