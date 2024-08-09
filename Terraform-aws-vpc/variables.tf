#################################################
    #    Project Variables #
#################################################
variable "project_name" {
  type = string
}

variable "environment" {
  type = string
  default = "dev"
}

variable "common_tags" {
  type = map

}

#################################################
    #    VPC Variables #
#################################################

variable "vpc_cidr" {
  type = string
  default = "10.0.0.0/16"
}

variable "enable_dns_hostnames" {
  type = bool
  default = true 
}

variable "vpc_tags" {
  type = map
  default = {}

}

#################################################
    #    IGW Variables Tags#
#################################################

variable "igw_tags" {
  type = map
  default = {}
}

#################################################
    #    AwS Subnets Tags #
#################################################


# Public Subnet Tags
variable "public_subnet_cidrs" {
  type = list
  validation {
    condition     = length(var.public_subnet_cidrs) ==2
    error_message = "Please provide 2 valid public subnet cidrs"
    }
}

variable "public_subnet_cidr_tags" {
  type = map
  default = {}
}

# Private Subnet Tags
variable "private_subnet_cidrs" {
  type = list
  validation {
    condition     = length(var.private_subnet_cidrs) ==2
    error_message = "Please provide 2 valid private subnet cidrs"
    }
}

variable "private_subnet_cidr_tags" {
  type = map
  default = {}
}

# DB Subnet Tags
variable "database_subnet_cidrs" {
  type = list
  validation {
    condition     = length(var.database_subnet_cidrs) ==2
    error_message = "Please provide 2 valid private subnet cidrs"
    }
}

variable "database_subnet_cidr_tags" {
  type = map
  default = {}
}

variable "nat_gateway_tags" {
  type = map
  default = {}
}

variable "public_route_table_tags" {
  type = map
  default = {}
}

variable "private_route_table_tags" {
  type = map
  default = {}
}

variable "database_route_table_tags" {
  type = map
  default = {}
}

#################################################
    #    AwS VPC Peering Tags #
#################################################

variable "is_peering_required" {
  type = bool
  default = false
}

variable "accepter_vpc_id" {
  type = string
  default = ""

}

variable "vpc_peering_tags" {
  type = map
  default = {}
}

variable "database_subnet_group_tags" {
  type = map
  default = {}
}