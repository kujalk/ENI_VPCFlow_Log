output "EC2-IP" {
  value = aws_instance.main.public_ip
}