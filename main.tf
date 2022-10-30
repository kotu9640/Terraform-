provider "aws" {
 profile = "default"
 region = "us-east-1"
}
resource "aws_vpc" "newvpc" {
cidr_block = "172.25.0.0/16"
enable_dns_support = "true"
enable_dns_hostnames = "true"
tags = {
  Name = "newvpc"
}
}
resource "aws_subnet" "newvpc-subnet1" {
vpc_id = aws_vpc.newvpc.id
cidr_block = "172.25.1.0/24"
availability_zone = "us-east-1a"
map_public_ip_on_launch = "true"
tags = {
  Name = "newvpc-subnet1"
}
}
resource "aws_internet_gateway" "newigw" {
vpc_id = aws_vpc.newvpc.id
tags = {
  Name = "newigw"
}
}
resource "aws_route_table" "rt_newvpc" {
vpc_id = aws_vpc.newvpc.id
route {
cidr_block = "0.0.0.0/0"
gateway_id = aws_internet_gateway.newigw.id
}
tags = {
Name = "rt_newvpc"
}
}
resource "aws_route_table_association" "rt_subnet1" {
subnet_id = aws_subnet.newvpc-subnet1.id
route_table_id = aws_route_table.rt_newvpc.id
}
