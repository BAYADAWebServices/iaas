resource "aws_organizations_organization" "BayadaOrg" {
  feature_set = "ALL"
}

resource "aws_organizations_organizational_unit" "operations" {
  name      = "Operations"
  parent_id = "${aws_organizations_organization.BayadaOrg.roots.0.id}"
}

resource "aws_organizations_organizational_unit" "testenv" {
  name      = "Test Environment"
  parent_id = "${aws_organizations_organization.BayadaOrg.roots.0.id}"
}