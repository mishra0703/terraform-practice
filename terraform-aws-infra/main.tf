# VPC with CIDR Block and Tag
resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "TerraWeek-VPC"
  }
}


resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true

  tags = {
    Name = "TerraWeek-Public-Subnet"
  }
}



resource "aws_internet_gateway" "my_igw" {
  vpc_id = aws_vpc.my_vpc.id
}



resource "aws_route_table" "rtable" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my_igw.id
  }
}



resource "aws_route_table_association" "rtable_with_subnet" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.rtable.id
}




resource "aws_security_group" "vpc_sg" {
  name        = "TerraWeek-SG"
  description = "Allow SSH and HTTP inbound, all outbound"
  vpc_id      = aws_vpc.my_vpc.id

  # SSH access
  ingress {
    description = "Allow SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # HTTP access
  ingress {
    description = "Allow HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow all outbound traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "TerraWeek-SG"
  }

}







# Ec2 Instance

resource "aws_instance" "terra-server" {
  ami                         = "ami-0b6d9d3d33ba97d99"
  instance_type               = "t2.micro"
  associate_public_ip_address = "true"
  subnet_id                   = aws_subnet.public.id
  vpc_security_group_ids      = [aws_security_group.vpc_sg.id]

  tags = {
    Name = "TerraWeek-Server"
  }

  lifecycle {
    create_before_destroy = true
  }
}
