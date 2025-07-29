# ALB Module

This module provisions an Application Load Balancer, Target Group, Listener, and Security Group.

## Outputs

- `alb_dns_name`
- `alb_arn`
- `target_group_arn`

## Example

module "alb" {
  source = "../modules/alb"

  name_prefix       = "indico"
  subnet_ids        = ["subnet-123", "subnet-456"]
  vpc_id            = "vpc-abc"
  health_check_path = "/"
  target_port       = 80

  tags = {
    Project = "Indico"
    Env     = "dev"
  }
}
