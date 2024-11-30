output "instance_id" {
  description = "ID de la instancia EC2"
  value       = aws_instance.ITMLab-EC2-Test.id
}

output "instance_public_ip" {
  description = "Dirección IP pública de la instancia"
  value       = aws_instance.ITMLab-EC2-Test.public_ip
}
