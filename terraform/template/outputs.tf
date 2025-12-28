output "instance_public_ip" {
  value = aws_instance.test_server.public_ip
}

output "selected_ami_id" {
  value = data.aws_ami.ubuntu.id
}
