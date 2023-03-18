resource "aws_ecs_task_definition" "ecs-demo" {
  family             = "task"
  task_role_arn      = aws_iam_role.ecs_task_role.arn
  execution_role_arn = aws_iam_role.ecs_task_execution_role.arn


  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = "256"
  memory                   = "1024"

  container_definitions = jsonencode([
    {
      name      = "hello-world"
      image     = "${aws_ecr_repository.fargate-demo.repository_url}:latest"
      essential = true
      portMappings = [
        {
          containerPort = 80
          hostPort      = 80
        }
      ]
    }
  ])
}

resource "aws_ecs_service" "fargate-svc" {
  name            = "fargate-svc"
  cluster         = aws_ecs_cluster.fargate-demo.id
  task_definition = aws_ecs_task_definition.ecs-demo.arn
  desired_count   = 1
  launch_type     = "FARGATE"
}