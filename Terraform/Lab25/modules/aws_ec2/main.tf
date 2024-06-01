resource "aws_security_group" "sg" {
  vpc_id      = var.vpc_id
 
}

resource "aws_vpc_security_group_ingress_rule" "ingress" {
  count = var.sg["ingress_count"][0]["count"]
  security_group_id = aws_security_group.sg.id
  from_port         = var.sg["ingress_rule"][count.index]["port"]
  to_port           = var.sg["ingress_rule"][count.index]["port"]
  ip_protocol       = var.sg["ingress_rule"][count.index]["protocol"]
  cidr_ipv4         = var.sg["ingress_rule"][count.index]["cidr"]
  tags = {
    Name = "ingress"
  }
}

resource "aws_vpc_security_group_egress_rule" "egress" {
  security_group_id = aws_security_group.sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" 
}

resource "aws_instance" "ec2_public" {
  ami             = var.ami
  instance_type   = var.instance_type
  subnet_id       = var.public_subnet_ids
  associate_public_ip_address = true
  security_groups = [aws_security_group.sg.id]
  tags = {
    Name = "public_ec2"
  }
}
