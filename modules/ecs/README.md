# ECS Module

This module provisions an ECS Cluster, Fargate Task Definition, Service, Security Group, and IAM Roles.

## Outputs

- `ecs_cluster_id`
- `task_definition_arn`
- `ecs_service_name`

## Example

module "ecs" {
  source = "../modules/ecs"

  name_prefix              = "indico-app"
  cluster_name             = "indico-cluster"
  cpu                      = "256"
  memory                   = "512"
  container_definitions_json = file("container_definitions.json")
  subnet_ids               = ["subnet-abc", "subnet-def"]
  vpc_id                   = "vpc-123"
  desired_count            = 2
  container_port           = 80
  tags = {
    Project = "Indico"
  }
}
