output "ecs_cluster_id" {
  value = aws_ecs_cluster.my_ecs_cluster.id
}

output "task_definition_arn" {
  value = aws_ecs_task_definition.my_ecs_task.arn
}

output "ecs_service_name" {
  value = aws_ecs_service.my_ecs_service.name
}
