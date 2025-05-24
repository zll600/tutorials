locals {
  # AWS region to deploy resources
  region = "us-east-2"
  
  # VPC CIDR blocks
  vpc_cidr = "10.0.0.0/16"
  
  # EKS cluster CIDR ranges for pods and services
  pod_cidr     = "10.0.0.0/14"
  service_cidr = "10.4.0.0/19"
  
  # Availability zones to use
  availability_zones = ["us-east-2a", "us-east-2b", "us-east-2c"]
  
  # Resource naming prefix
  name_prefix = "eks-demo"
}
