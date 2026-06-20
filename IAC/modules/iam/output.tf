output "eks_role_arn" {
  value = aws_iam_role.eks_role.arn

}

output "ec2_role_arn" {
  value = aws_iam_role.ec2_role.arn
}

output "node_group_role_arn" {
  value = aws_iam_role.node_group_role.arn
}

