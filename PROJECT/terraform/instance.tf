resource "tls_private_key" "key" {
  algorithm = "RSA"
}

resource "local_sensitive_file" "private_key" {
  content         = tls_private_key.key.private_key_pem
  filename        = var.KEY_NAME
  file_permission = "0400"
}

resource "aws_key_pair" "key_pair" {
  key_name   = var.KEY_NAME
  public_key = tls_private_key.key.public_key_openssh
}

resource "aws_instance" "server-mosquitto-project" {
  ami                    = var.AMIS[var.REGION]
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.tcc-pub-1.id
  key_name               = aws_key_pair.key_pair.key_name
  vpc_security_group_ids = [aws_security_group.mosquitto-project_sg.id]

  tags = {
    Name = "server-mosquitto-project"
  }
}

resource "aws_instance" "sensor1-client-temperatura-project" {
  ami                    = var.AMIS[var.REGION]
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.tcc-pub-1.id
  key_name               = aws_key_pair.key_pair.key_name
  vpc_security_group_ids = [aws_security_group.sensor-client-temperatura-project_sg.id]

  tags = {
    Name = "sensor1-client-temperatura-project"
  }
}

resource "aws_instance" "grafana-project" {
  ami                    = var.AMIS[var.REGION]
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.tcc-pub-1.id
  key_name               = aws_key_pair.key_pair.key_name
  vpc_security_group_ids = [aws_security_group.grafana-project_sg.id]

  tags = {
    Name = "grafana-project"
  }
}

output "Grafana-Project-Public-IP" {
  value = aws_instance.grafana-project.public_ip
}
output "Server-mosquitto-project-Public-IP" {
  value = aws_instance.server-mosquitto-project.public_ip
}

output "Sensor1-client-temperatura-project-Public-IP" {
  value = aws_instance.sensor1-client-temperatura-project.public_ip
}