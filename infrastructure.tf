resource "aws_vpc" "terraform_vpc" {
  cidr_block = var.vpc_cidr
}

resource "aws_internet_gateway" "my_igw" {
  vpc_id = aws_vpc.terraform_vpc.id
} 