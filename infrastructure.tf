################################# VPC & IGW #################################
resource "aws_vpc" "terraform_vpc" {
  cidr_block = var.vpc_cidr
}

resource "aws_internet_gateway" "my_igw" {
  vpc_id = aws_vpc.terraform_vpc.id
} 

################################# Pub & Priv Subnets #################################
resource "aws_subnet" "PublicSubnet1" {
  vpc_id     = aws_vpc.terraform_vpc.id
  availability_zone = var.AZ1
  cidr_block = var.PublicSubnet1_CIDR
  map_public_ip_on_launch = "true"
}
resource "aws_subnet" "PublicSubnet2" {
  vpc_id     = aws_vpc.terraform_vpc.id
  availability_zone = var.AZ2
  cidr_block = var.PublicSubnet2_CIDR
  map_public_ip_on_launch = "true"
}
resource "aws_subnet" "PrivateSubnet1" {
  vpc_id     = aws_vpc.terraform_vpc.id
  availability_zone = var.AZ1
  cidr_block = var.PrivateSubnet1_CIDR
  map_public_ip_on_launch = "true"
}
resource "aws_subnet" "PrivateSubnet2" {
  vpc_id     = aws_vpc.terraform_vpc.id
  availability_zone = var.AZ2
  cidr_block = var.PrivateSubnet2_CIDR
  map_public_ip_on_launch = "true"
}

################################ EIP & NAT Gateway ################################
resource "aws_eip" "eip_nat" {
}

resource "aws_nat_gateway" "nat_pub1" {
  allocation_id = aws_eip.eip_nat.id
  subnet_id = aws_subnet.PublicSubnet1.id
}