import {
  id = "i-007e2b18791c583c4"
  to = aws_instance.my_existing_server
}


resource "aws_instance" "my_existing_server" {
  ami = "ami-0b6d9d3d33ba97d99"
  instance_type = "t3.micro"
  key_name = "linux-for-decops-2"

  tags = {
    Name = "testing-server"
  }
}