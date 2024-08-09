
# resource <resourcename> <name>
resource "aws_security_group" "allow_ABC" {
  name        = "allow_SSH"
  description = var.sg_desc
#   vpc_id      = aws_vpc.main.id

    ingress {
    from_port        =var.port #Specifies the starting port range for incoming traffic. Here, it's set to 22, which is typically used for SSH.
    to_port          =var.port #Specifies the ending port range for incoming traffic. It's also set to 22, meaning only SSH traffic on port 22 is allowed.
    # Protocol refers to a set of rules or standards governing communication between devices or systems.
    protocol         = var.protocol #TCP Protocol specifically refers to the Transmission Control Protocol, a reliable, connection-oriented protocol providing ordered and error-checked delivery of data over networks.
    cidr_blocks      = var.allow_cidr #Specifies the CIDR block (IP address range) that is allowed to access the port. "0.0.0.0/0" allows access from any IP address, which is generally not recommended for security reasons as it opens SSH access to the entire internet (0.0.0.0/0).
  }

    egress {
    from_port        = 0 # from 0 to 0 means , allow all ports
    to_port          = 0
    protocol         = "-1" #Specifies the protocol to allow. -1 here means all protocols.
    cidr_blocks      = var.allow_cidr #Specifies the CIDR block (IP address range) that is allowed to receive outgoing traffic. "0.0.0.0/0" allows outgoing traffic to any IP address.
  }



  tags = {
    Name = "allow_tls"
  }
}



resource "aws_instance" "db" {
  ami           = var.image_id
  instance_type = var.tags.Name == "DB" ? "t3.micro" : var.instance_type
  vpc_security_group_ids = [aws_security_group.allow_ABC.id]

  tags = var.tags
}