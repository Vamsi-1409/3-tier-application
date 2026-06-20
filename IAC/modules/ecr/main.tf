resource "aws_ecr_repository" "ecr_repo_frontend" {
  name = "${var.ecr_repo_name}-frontend"
  image_scanning_configuration {
    scan_on_push = true
  }

}

resource "aws_ecr_repository" "ecr_repo_backend" {
  name = "${var.ecr_repo_name}-backend"
  image_scanning_configuration {
    scan_on_push = true
  }

}