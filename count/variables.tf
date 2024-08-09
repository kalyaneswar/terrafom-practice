variable "image_id" {
  type = string
  default = "ami-041e2ea9402c46c32"
  description = "this is rhel ami user name passwd auth instance"
}

variable "instance_type" {
  type = string
  default = "t2.micro"
}

variable "tags" {
  default = {
    Project = "Expense"
    Environment = "Dev"
    Module = "DB"
    Name = "DB"
  }
}

variable "sg_desc" {
    type = string
  default = "Allow TLS inbound traffic and all outbound traffic"
}

variable "port" {
  type = number
  default = 22
}

variable "protocol" {
  default = "TCP"
}

variable "allow_cidr" {
    type = list(string)
  default = ["0.0.0.0/0"]
}

variable "instance_names" {
  type = list
  default = ["db", "backend", "frontend"]
}