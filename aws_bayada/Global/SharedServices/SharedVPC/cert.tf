
resource "aws_acm_certificate" "bayadawebservices" {
  #provider          = "aws.shared_services"
  domain_name       = "*.bayadawebservices.com"
  validation_method = "DNS"
}
