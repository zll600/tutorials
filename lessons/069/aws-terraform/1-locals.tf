locals {
  region               = "us-east-2"
  org_id               = "206720471760"
  billing_account      = "01FDA3-9697F3-6F05B8"
  host_project_name    = "host-staging"
  service_project_name = "k8s-staging"
  host_project_id      = "${local.host_project_name}-${random_integer.int.result}"
  service_project_id   = "${local.service_project_name}-${random_integer.int.result}"
  projects_api         = "container.googleapis.com"
  
  # AWS VPC CIDR blocks
  vpc_cidr             = "10.0.0.0/16"
  
  # Equivalent to GCP's secondary_ip_ranges
  pod_cidr             = "10.0.0.0/14"
  service_cidr         = "10.4.0.0/19"
  
  # Availability zones
  availability_zones   = ["us-east-2a", "us-east-2b", "us-east-2c"]
}
