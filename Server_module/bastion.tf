

resource "aws_instance" "ec2_bastion" {
  ami                         = "ami-08c40ec9ead489470"
  instance_type               = "t2.micro"
  key_name                    = "ansible-key"
  subnet_id                   = module.infra_module.PublicSubnet1_id
  vpc_security_group_ids      = [aws_security_group.allow_http_https_ssh.id]
  associate_public_ip_address = true
  provisioner local-exec {
    command = "echo ${self.public_ip} > bastion_ip.txt"   
  }
}

resource "aws_instance" "ec2_application" {
  ami                    = "ami-08c40ec9ead489470"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.allow_ssh_3000.id]
  subnet_id              =  module.infra_module.PrivateSubnet1_id  # aws_subnet.public_subnet_1.id

}