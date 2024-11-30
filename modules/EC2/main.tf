
##### SG ######
resource "aws_security_group" "ITMLab-EC2-Test" {
  name        = "${var.instance_name}-sg"
  description = "Security Group para la instancia EC2 ${var.instance_name}"
  vpc_id       = var.vpc_id

  # Reglas de entrada
  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Reglas de salida
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.instance_name}-sg"
  }
}


##### EC2 ######

resource "aws_instance" "ITMLab-EC2-Test" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name  # Asigna el nombre de la llave aquí
  subnet_id     = var.ec2_subnet_id
  security_groups = [aws_security_group.ITMLab-EC2-Test.id]  # Asociar el Security Group
  user_data = var.ec2_user_data


  tags = {
    Name = var.instance_name
  }
}