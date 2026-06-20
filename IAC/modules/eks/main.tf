resource "aws_eks_cluster" "eks_cluster" {
  name     = var.cluster_name
  role_arn = var.eks_cluster_role_arn

  vpc_config {
    subnet_ids         = var.subnet_ids
    security_group_ids = [aws_security_group.eks_cluster_sg.id]
  }

  tags = {
    Name = var.cluster_name
    app  = "3tier-application"
  }
}

resource "aws_eks_node_group" "eks_node_group" {
  cluster_name    = aws_eks_cluster.eks_cluster.name
  node_group_name = "${var.cluster_name}-node-group"
  node_role_arn   = var.node_group_role_arn
  subnet_ids      = var.subnet_ids
  instance_types  = var.instance_types

  scaling_config {
    desired_size = var.desired_capacity
    max_size     = var.max_size
    min_size     = var.min_size
  }

  tags = {
    Name = "${var.cluster_name}-node-group"
    app  = "3tier-application"
  }
}

resource "aws_security_group" "eks_cluster_sg" {
  vpc_id = var.vpc_id

  tags = {
    Name = "${var.cluster_name}-eks-cluster-sg"
    app  = "3tier-application"
  }

  ingress {
    from_port = 0
    to_port   = 0
    protocol  = "tcp"
    self      = true
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}