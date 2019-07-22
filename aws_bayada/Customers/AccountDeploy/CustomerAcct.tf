resource "aws_organizations_account" "newcustomeraccount" {
  name      = "${var.account_name}"
  email     = "${var.account_email}"
  role_name = "${var.account_admin_role}"
  parent_id = "${var.ou_parent_id}"

  # There is no AWS Organizations API for reading role_name
  lifecycle {
    ignore_changes = ["role_name"]
  }
}