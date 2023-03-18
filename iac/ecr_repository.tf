resource "aws_ecr_repository" "fargate-demo" {
  name                 = "fargate-demo"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}

output "ecr_repository" {
  value = aws_ecr_repository.fargate-demo.repository_url
}
