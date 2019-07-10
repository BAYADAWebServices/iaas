resource "tls_private_key" "jenkins" {
  algorithm = "RSA"
}

resource "tls_self_signed_cert" "jenkins" {
  key_algorithm   = "${tls_private_key.jenkins.algorithm}"
  private_key_pem = "${tls_private_key.jenkins.private_key_pem}"
  validity_period_hours = 26280

  # Generate a new certificate if Terraform is run within three
  # hours of the certificate's expiration time.
  early_renewal_hours = 3

  # Reasonable set of uses for a server SSL certificate.
  allowed_uses = [
      "key_encipherment",
      "digital_signature",
      "server_auth",
  ]
  dns_names = ["${local.subdomain}.${var.r53_zone_name}"]
  subject {
      common_name  = "jenkins.${var.r53_zone_name}"
      organization = "${local.tags["Application"]}"
  }
}
