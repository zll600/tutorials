# AWS doesn't have direct "project" equivalents like Google Cloud
# Instead, we'll use AWS organizations and accounts as equivalents

# Create an AWS organization
resource "aws_organizations_organization" "org" {
  feature_set = "ALL"
}

# Create an organizational unit for staging environments
resource "aws_organizations_organizational_unit" "staging" {
  name      = "Staging"
  parent_id = aws_organizations_organization.org.roots[0].id
}

# Create an AWS account for host project
resource "aws_organizations_account" "host-staging" {
  name      = local.host_project_name
  email     = "aws+${local.host_project_id}@example.com"
  parent_id = aws_organizations_organizational_unit.staging.id
}

# Create an AWS account for kubernetes project
resource "aws_organizations_account" "k8s-staging" {
  name      = local.service_project_name
  email     = "aws+${local.service_project_id}@example.com"
  parent_id = aws_organizations_organizational_unit.staging.id
}

# Enable EKS service in the kubernetes account
# AWS doesn't have an exact equivalent of google_project_service
# Instead, you'd typically create the necessary IAM roles and policies
# This is a placeholder for demonstration purposes
resource "aws_iam_service_linked_role" "eks" {
  aws_service_name = "eks.amazonaws.com"
}