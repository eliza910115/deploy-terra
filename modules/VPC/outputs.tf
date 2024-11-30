output "vpc_id" {
    description = "VPC ID"
    value = aws_vpc.VPCITMKubernetes.id
}

output "subnet1_cidr" {
    description = "Subnet 1 ID"
    value = aws_subnet.SubnetITMKubernetes1.id
}

output "subnet2_cidr" {
    description = "Subnet 2 ID"
    value = aws_subnet.SubnetITMKubernetes2.id
}