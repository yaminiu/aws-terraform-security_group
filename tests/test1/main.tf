terraform {
  required_version = ">= 0.12"
}

provider "aws" {
  version = "~> 2.2"
  region  = "us-west-2"
}

module "base_network" {
  source = "git@github.com:rackspace-infrastructure-automation/aws-terraform-vpc_basenetwork?ref=master"

  name = "SG-VPC-TEST"
}

module "test_sg" {
  source = "../../module"

  name   = "my_test_sg"
  vpc_id = module.base_network.vpc_id
}
