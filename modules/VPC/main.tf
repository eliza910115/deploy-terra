##### vpc ######

resource "aws_vpc" "VPCITMKubernetes" {
    cidr_block = var.vpc_cird
    instance_tenancy = "default"
    tags = {
      "Name" = var.vpc_name 
    }
  
}

#subnets###

resource "aws_subnet" "SubnetITMKubernetes1" {
    vpc_id = aws_vpc.VPCITMKubernetes.id
    cidr_block = var.subnet1_cidr
    availability_zone = var.availability_zone_1
    map_public_ip_on_launch = true
    tags = {
        Name = var.subnet_1_name
    }
    depends_on = [ aws_vpc.VPCITMKubernetes ]

}

resource "aws_subnet" "SubnetITMKubernetes2" {
    vpc_id = aws_vpc.VPCITMKubernetes.id
    cidr_block = var.subnet2_cidr
    availability_zone = var.availability_zone_2
    map_public_ip_on_launch = true
    tags = {
        Name = var.subnet_2_name
    }
    depends_on = [ aws_vpc.VPCITMKubernetes ]
}

####Gateway###

resource "aws_internet_gateway" "IG_ITMKubernetes" {
    vpc_id = aws_vpc.VPCITMKubernetes.id
    depends_on = [ aws_vpc.VPCITMKubernetes ]
 
}

##Route table ####

resource "aws_route_table" "RT_ITMKubernetes" {
    vpc_id = aws_vpc.VPCITMKubernetes.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.IG_ITMKubernetes.id
    }
    depends_on = [ aws_internet_gateway.IG_ITMKubernetes ]
  
}

resource "aws_main_route_table_association" "RT_Association_ITMKubernetes" {
    route_table_id = aws_route_table.RT_ITMKubernetes.id
    vpc_id = aws_vpc.VPCITMKubernetes.id
}