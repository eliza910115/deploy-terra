#VPC CIDR Block
variable "vpc_cird" {
    type = string
    description = "VPC CIDR"
  
}

##VPC name
variable "vpc_name" {
    type = string
    description = "VPC Name"  
}

#subnet 1
variable "subnet1_cidr" {
    type = string
    description = "Subnet 1 CIDR"
}

variable "subnet_1_name" {
    type = string
    description = "Subnet 1 name"
}

variable "availability_zone_1" {
    type = string
    description = "Subnet 1 Availability Zone"
}

#subnet 2
variable "subnet2_cidr" {
    type = string
    description = "Subnet 2 CIDR"
}

variable "subnet_2_name" {
    type = string
    description = "Subnet 2 name"
}

variable "availability_zone_2" {
    type = string
    description = "Subnet 2 Availability Zone"
}