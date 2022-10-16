output "vpc_id" {
  value = module.infra_module.aws_vpc.terraform_vpc.id
}

output "PublicSubnet1_id" {
  value = module.infra_module.aws_subnet.PublicSubnet1.id
}
output "PublicSubnet2_id" {
  value = module.infra_module.aws_subnet.PublicSubnet2.id
}

output "PrivateSubnet1_id" {
  value = module.infra_module.aws_subnet.PrivateSubnet1.id
}
output "PrivateSubnet2_id" {
  value = module.infra_module.aws_subnet.PrivateSubnet2.id
}