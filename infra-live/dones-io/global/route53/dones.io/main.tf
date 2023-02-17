locals {
  domain_name = "dones.io"
}

resource "aws_route53_zone" "this" {
  name = local.domain_name
}
