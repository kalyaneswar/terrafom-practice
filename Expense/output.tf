output "instance_info" {
  value = aws_instance.expense[*].public_ip
}

output "route53_zone_name" {
  description = "Name of Route53 zone"
  value       = aws_route53_record.expense[*].name
}