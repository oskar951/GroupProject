provider "aws" {
  region                  = "eu-west-1"
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

module "rds_instance" {
  source    = "./RDS"
  vpc_sg_id = module.aws_webserver_sg.aws_wsg_id
  subnetA   = module.aws_vpc.public_subnetA_id
  subnetB   = module.aws_vpc.public_subnetB_id
  username  = "${var.usr}"
  password  = "${var.pswd}"
}

# module "eks" {
#   source  = "./EKS"
#   subnets = [module.aws_vpc.public_subnetA_id, module.aws_vpc.public_subnetB_id]
# }

module "lambda" {
  source = "./LAMBDA"
  role   = module.aws_iam.lambda_role
}

module "sns" {
  source          = "./SNS"
  lambda_recovery = module.lambda.lambdaInstanceArn
}

module "cloudwatch" {
  source                = "./CLOUDWATCH"
  instanceID            = module.webserver_node.ec2_id
  instance_recovery_arn = module.sns.recovery_arn
  lambda_image_arn      = module.lambda.lambdaImageArn
  lambda_snapshot_arn   = module.lambda.lambdaSnapshotArn
}