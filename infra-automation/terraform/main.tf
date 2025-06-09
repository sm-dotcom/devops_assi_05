provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "web" {
  ami           = "ami-0c02fb55956c7d316" # Amazon Linux 2
  instance_type = "t2.micro"
  key_name      = "your-key-name" # Replace with your key name

  tags = {
    Name = "Ansible-Web-Instance"
  }

  provisioner "local-exec" {
    command = "echo ${self.public_ip} > ../ansible/hosts.ini"
  }
}
