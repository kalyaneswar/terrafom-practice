resource "aws_route53_record" "expense" {
  zone_id = var.aws_route53_zone
  count = length(var.instance_name)
  name    = var.instance_name[count.index] == "frontend" ? "expense.${var.domain_name}" : "${var.instance_name[count.index]}.${var.domain_name}"
  type    = "A"
  ttl     = 1
  records = var.instance_name[count.index] == "frontend" ? [aws_instance.expense[count.index].public_ip] : [aws_instance.expense[count.index].private_ip]
  allow_overwrite = true
}