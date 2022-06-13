resource "aws_ecs_service" "default" {
  name          = var.name
  cluster       = var.cluster_id
  desired_count = 3
  iam_role      = var.iam_role_arn
}
