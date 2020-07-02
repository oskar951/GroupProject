provider "aws" {
  region                  = "eu-west-2"
  shared_credentials_file = "/home/ubuntu/.aws/credentials"
}

module "aws_iam" {
  source = "./IAM_ROLES"
}

module "aws_vpc" {
  source = "./VPC"
}

module "aws_webserver_sg" {
  source = "./SG"
  name   = "WebServerSG"
  vpc_id = module.aws_vpc.vpc_id
}

module "webserver_node" {
  source                 = "./EC2"
  subnet_id              = module.aws_vpc.public_subnetA_id
  vpc_security_group_ids = module.aws_webserver_sg.aws_wsg_id
  iam_instance_profile   = module.aws_iam.iam_instance_profile

  tags = {
    Name = "WebServer_Node"
  }
  associate_public_ip_address = true
}