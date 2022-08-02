data "vault_aws_access_credentials" "ec2-creds" {
  backend = "aws"
  role    = "deploy_ec2"
}

data "vault_aws_access_credentials" "s3-creds" {
  backend = "aws"
  role    = "deploy_s3"
}

data "tfe_outputs" "vault" {
  organization = "my-demo-account"
  workspace    = "hcp-vault"
}

provider "aws" {
  alias  = "ec2"
  region = "us-east-1"

  access_key = "${data.vault_aws_access_credentials.ec2-creds.access_key}"
  secret_key = "${data.vault_aws_access_credentials.ec2-creds.secret_key}"
}

provider "aws" {
  alias  = "s3"
  region = "us-east-1"

  access_key = "${data.vault_aws_access_credentials.s3-creds.access_key}"
  secret_key = "${data.vault_aws_access_credentials.s3-creds.secret_key}"
}

provider "vault" {
  address   = data.tfe_outputs.vault.values.vault_public_addr
  namespace = data.tfe_outputs.vault.values.vault_ns

  token = var.vault_token
}

resource "random_pet" "name" {
  length = 1
}

module "ec2" {
  source = "./modules/ec2"
  providers = {
    aws = aws.ec2
  }
  
  name = "${random_pet.name.id}${var.name}"
  key_name = var.key_name

}

module "s3" {
  source = "./modules/s3"
  providers = {
    aws = aws.s3
   }

  name = "${random_pet.name.id}${var.name}"
}