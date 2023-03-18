resource "aws_ecs_cluster" "fargate-demo" {
  name = "fargate-demo"

  setting {
    name  = "containerInsights"
    value = "enabled"
  }
}