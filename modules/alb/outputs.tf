output "alb_dns_name" {
  value = aws_lb.my_alb.dns_name
}

output "alb_arn" {
  value = aws_lb.my_alb.arn
}

output "target_group_arn" {
  value = aws_lb_target_group.my_alb.arn
}
