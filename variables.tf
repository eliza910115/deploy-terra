variable "vpc_cidr" {
  type = map(string)
  default = {
    "default" = "192.168.0.0/24"
    "dev"     = "192.168.1.0/24"
  }

}

variable "vpc_name" {
  type = map(string)
  default = {
    "default" = "VPCITMKubernetesDefault"
    "dev"     = "VPCITMKubernetesDev"
  }

}

#subnet 1
variable "subnet1_cidr" {
  type = map(string)
  default = {
    "default" = "192.168.0.0/27"
    "dev"     = "192.168.1.0/27"
  }
}

variable "subnet_1_name" {
  type = map(string)
  default = {
    "default" = "SubnetITMKubernetes1Default"
    "dev"     = "SubnetITMKubernetes1Dev"
  }

}

variable "availability_zone_1" {
  type = map(string)
  default = {
    "default" = "us-east-1a"
    "dev"     = "us-east-1a"
  }

}

#subnet 2
variable "subnet2_cidr" {
  type = map(string)
  default = {
    "default" = "192.168.0.32/27"
    "dev"     = "192.168.1.32/27"
  }
}

variable "subnet_2_name" {
  type = map(string)
  default = {
    "default" = "SubnetITMKubernetes2Default"
    "dev"     = "SubnetITMKubernetes2Dev"
  }

}

variable "availability_zone_2" {
  type = map(string)
  default = {
    "default" = "us-east-1b"
    "dev"     = "us-east-1b"
  }

}

variable "ec2_user_data" {
  type = map(string)
  default = {
    "default" = <<EOF
    #!/bin/bash
    yum update -y
    amazon-linux-extras install mariadb10.5
    amazon-linux-extras install php8.2
    yum install -y httpd
    systemctl start httpd
    systemctl enable httpd
    EOF
  }
}

