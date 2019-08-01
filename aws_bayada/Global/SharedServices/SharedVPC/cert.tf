resource "aws_acm_certificate" "bayadawebservices" {
  domain_name       = "*.bayadawebservices.com"
  validation_method = "DNS"
}