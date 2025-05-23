# AWS Resource Access Manager (RAM) allows you to share resources across AWS accounts
# This is the AWS equivalent of GCP's Shared VPC

# Create RAM Resource Share for VPC sharing
resource "aws_ram_resource_share" "vpc_share" {
  name                      = "vpc-share"
  allow_external_principals = false

  tags = {
    Name = "vpc-share"
  }
}

# Share VPC with service account
resource "aws_ram_principal_association" "vpc_share" {
  principal          = aws_organizations_account.k8s-staging.id
  resource_share_arn = aws_ram_resource_share.vpc_share.arn
}

# Share subnets with service account
resource "aws_ram_resource_association" "private_subnets" {
  count              = length(aws_subnet.private)
  resource_arn       = aws_subnet.private[count.index].arn
  resource_share_arn = aws_ram_resource_share.vpc_share.arn
}

# IAM role for EKS to use in the shared VPC
resource "aws_iam_role" "eks_vpc_access" {
  name = "eks-vpc-access"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "eks.amazonaws.com"
        }
      }
    ]
  })

  tags = {
    Name = "eks-vpc-access"
  }
}