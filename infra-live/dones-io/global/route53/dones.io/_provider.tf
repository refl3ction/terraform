provider "aws" {
  region = "us-east-1"
  allowed_account_ids = [
    "935807483511"
  ]
  assume_role {
    role_arn = "arn:aws:iam::935807483511:role/terraform"
  }
}
