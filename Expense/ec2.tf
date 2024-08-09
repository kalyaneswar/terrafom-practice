resource "aws_instance" "expense" {
  ami           = var.ami_id
  count = length(var.instance_name)
  instance_type = var.instance_name[count.index] == "db" ? "t3.micro" : "t2.micro"
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]

  tags = {
    Name = var.instance_name[count.index]
  }
}


resource "aws_security_group" "allow_ssh" {
  name        = "allow_SSH"
  description = "Allow SSH inbound traffic and all outbound traffic"


  tags = {
    Name = "Allow_SSH"
    Project = "Expense"
    Modulue = "Dev"
    CreatedBy = "Kalyan"

  }
  ingress {
    description = "TLS from VPC"
    from_port   = var.ssh_port
    to_port     = var.ssh_port
    protocol    = var.tcp_protocol
    cidr_blocks = var.cidr_blocks
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = var.cidr_blocks
  }
}