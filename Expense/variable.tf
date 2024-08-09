variable "ami_id" {
  default = "ami-041e2ea9402c46c32"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "instance_name" {
  type = list(string)
  default = [ "db", "frontend", "backend" ]
}

variable "cidr_blocks" {
    type = list(string)
    default = ["0.0.0.0/0"]
}

variable "ssh_port" {
    type = number
    default = 22
  
}

variable "tcp_protocol" {
    type = string
    default = "tcp"
}

variable "aws_route53_zone" {
  default = "Z01370322SFFL52EA1U8P"
}

variable "domain_name" {
  default = "kalyaneswar.online"
}