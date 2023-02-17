terraform {
  backend "s3" {
    bucket   = "dones-tf-state"
    encrypt  = true
    key      = "dones-io/global/route53/dones.io/terraform.tfstate"
    region   = "us-east-1"
    role_arn = "arn:aws:iam::935807483511:role/terraform"
  }
}
