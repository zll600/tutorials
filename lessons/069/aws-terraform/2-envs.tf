# When using a single AWS account, we don't need AWS Organizations
# This file now contains placeholders for environment identification

# Generate random suffix for resource naming
resource "random_id" "suffix" {
  byte_length = 4
}

# Define environment variables for tagging and identification
locals {
  environment = "demo"
  app_name    = "k8s-demo"
  
  # Common tags to be applied to all resources
  common_tags = {
    Environment = local.environment
    Project     = local.app_name
    ManagedBy   = "opentofu"
    Owner       = "lg"
  }
}