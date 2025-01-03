#####VPC module ########
module "VPC" {
  source = "./modules/VPC"


  ##### VPC ###
  vpc_cird = var.vpc_cidr[terraform.workspace]
  vpc_name = var.vpc_name[terraform.workspace]


  ######## Subnets #####
  ##subnet 1
  availability_zone_1 = var.availability_zone_1[terraform.workspace]
  subnet1_cidr = var.subnet1_cidr[terraform.workspace]
  subnet_1_name = var.subnet_1_name[terraform.workspace]

    ##subnet 2
  availability_zone_2 = var.availability_zone_2[terraform.workspace]
  subnet2_cidr = var.subnet2_cidr[terraform.workspace]
  subnet_2_name = var.subnet2_cidr[terraform.workspace]


}

module "EC2" {
  source        = "./modules/EC2"
  ami_id        = "ami-005fc0f236362e99f"  # ID de la AMI que deseas usar
  instance_type = "t2.micro"               # Cambia el tipo según tus necesidades
  instance_name = "mi_ec2_instance"
  key_name      ="kp-rne-ec2lab"
  vpc_id = module.VPC.vpc_id
  ec2_subnet_id = module.VPC.subnet1_cidr
  ec2_user_data =  <<-EOF
    #!/bin/bash
    sudo apt-get update -y
    sudo apt-get install -y docker.io
    sudo systemctl start docker
    sudo systemctl enable docker
    # Descargar y ejecutar el contenedor Docker
    docker run -dit -p 5000:5000 -it eliblandon/game_catch
  EOF
}
