# main.tf

provider "aws" {
  region = "us-east-1"
}

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true
}


resource "aws_subnet" "private" {
  for_each = { for subnet in var.private_subnets : subnet.cidr_block => subnet }

  vpc_id            = aws_vpc.main.id
  cidr_block        = each.value.cidr_block
  availability_zone = each.value.availability_zone
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }
}

resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}

resource "aws_security_group" "allow_ssh" {
  vpc_id = aws_vpc.main.id

  ingress {
    from_port   = 22
    to_port     = 22
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

resource "aws_instance" "app" {
  ami                    = "ami-032346ab877c418af"
  instance_type          = "m5.large"
  subnet_id              = aws_subnet.public.id
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]

  tags = {
    Name = "AppServer"
  }
}

resource "aws_db_instance" "default" {
  allocated_storage    = 20
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t3.small"
  db_name              = "mydb"
  username             = "admin"
  password             = "password"
  parameter_group_name = "default.mysql5.7"
  publicly_accessible  = false
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]
  db_subnet_group_name = aws_db_subnet_group.main.id
  skip_final_snapshot  = true 
}

resource "aws_db_subnet_group" "main" {
  name       = "main"
  subnet_ids = [for subnet in aws_subnet.private : subnet.id]

  tags = {
    Name = "MainDBSubnetGroup"
  }
}

