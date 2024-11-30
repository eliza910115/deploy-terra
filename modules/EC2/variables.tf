variable "ami_id" {
  description = "AMI ID para la instancia"
  type        = string
}

variable "instance_type" {
  description = "Tipo de instancia EC2"
  type        = string
  default     = "t2.micro"
}

variable "instance_name" {
  description = "Nombre de la instancia"
  type        = string
  default     = "mi_ec2"
}

variable "key_name" {
  description = "Nombre del par de llaves para la instancia EC2"
  type        = string
  default     = null
}

variable "vpc_id" {
  description = "Id de la vpc"
  type        = string
}

variable "ec2_subnet_id" {
  description = "Id des la subnet"
  type        = string
}

variable "ec2_user_data" {
  description = "user data"
  type        = string
}

