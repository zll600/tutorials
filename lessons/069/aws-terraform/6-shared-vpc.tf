# When using a single AWS account, we don't need AWS RAM resources for sharing
# Instead, we'll create IAM roles and policies for EKS to use the VPC resources

# IAM role for EKS to use VPC resources
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

  tags = merge(
    local.common_tags,
    {
      Name = "eks-vpc-access"
    }
  )
}

# Policy to allow EKS to manage VPC resources
resource "aws_iam_policy" "eks_vpc_policy" {
  name        = "eks-vpc-policy"
  description = "Policy that allows EKS to manage VPC resources"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "ec2:CreateNetworkInterface",
          "ec2:DeleteNetworkInterface",
          "ec2:DetachNetworkInterface",
          "ec2:ModifyNetworkInterfaceAttribute",
          "ec2:DescribeNetworkInterfaces",
          "ec2:DescribeVpcs",
          "ec2:DescribeSubnets",
          "ec2:DescribeSecurityGroups",
          "ec2:DescribeRouteTables"
        ]
        Effect   = "Allow"
        Resource = "*"
      }
    ]
  })
}

# Attach the policy to the role
resource "aws_iam_role_policy_attachment" "eks_vpc_attachment" {
  role       = aws_iam_role.eks_vpc_access.name
  policy_arn = aws_iam_policy.eks_vpc_policy.arn
}