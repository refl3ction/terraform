locals {
  domain_name = "dones.io"
}

data "terraform_remote_state" "hosted_zone" {
  backend = "s3"
  config = {
    bucket = "dones-tf-state"
    key    = "dones-io/global/route53/dones.io/terraform.tfstate"
    region = "us-east-1"
  }
}

module "acm" {
  source  = "terraform-aws-modules/acm/aws"
  version = "~> 4.0"

  domain_name = local.domain_name
  zone_id     = data.terraform_remote_state.hosted_zone.outputs.zone_id

  subject_alternative_names = [
    format("*.%s", local.domain_name)
  ]

  wait_for_validation = true

  tags = {
    Name = local.domain_name
  }
}
