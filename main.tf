module "infra_module" {
  source              = "./Infra_module"
  vpc_cidr            = var.vpc_cidr
  AZ1                 = var.AZ1
  AZ2                 = var.AZ2
  PublicSubnet1_CIDR  = var.PublicSubnet1_CIDR
  PublicSubnet2_CIDR  = var.PublicSubnet2_CIDR
  PrivateSubnet1_CIDR = var.PrivateSubnet1_CIDR
  PrivateSubnet2_CIDR = var.PrivateSubnet2_CIDR
}

module "serverless_module" {
  source = "./serverless_module"
}