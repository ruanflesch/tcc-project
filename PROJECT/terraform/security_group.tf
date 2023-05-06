resource "aws_security_group" "sensor-client-temperatura-project_sg" {
  vpc_id      = aws_vpc.tcc-project.id
  name        = "sensor-client-temperatura-project_sg"
  description = "sensor-client-temperatura-project_sg"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "SSH Anywhere"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.MYANYWHERE]
  }

  ingress {
    description = "Prometheus port"
    from_port   = 9100
    to_port     = 9100
    protocol    = "tcp"
    cidr_blocks = ["${aws_instance.grafana-project.public_ip}/32"]
  }

  ingress {
    description = "MQTT Anywhere"
    from_port   = 1883
    to_port     = 1883
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "sensor-client-temperatura-project_sg"
  }
}


resource "aws_security_group" "mosquitto-project_sg" {
  vpc_id      = aws_vpc.tcc-project.id
  name        = "mosquitto-project_sg"
  description = "mosquitto-project_sg"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "SSH Anywhere"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.MYANYWHERE]
  }

  ingress {
    description = "Prometheus port"
    from_port   = 9100
    to_port     = 9100
    protocol    = "tcp"
    cidr_blocks = ["${aws_instance.grafana-project.public_ip}/32"]
  }

  ingress {
    description = "MQTT Anywhere"
    from_port   = 1883
    to_port     = 1883
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "mosquitto-project_sg"
  }
}






resource "aws_security_group" "grafana-project_sg" {
  vpc_id      = aws_vpc.tcc-project.id
  name        = "grafana-project_sg"
  description = "grafana-project_sg"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "SSH Anywhere"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.MYANYWHERE]
  }

  ingress {
    description = "Grafana Anywhere"
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = [var.MYANYWHERE]
  }

  ingress {
    description = "Prometheus Anywhere"
    from_port   = 9090
    to_port     = 9090
    protocol    = "tcp"
    cidr_blocks = [var.MYANYWHERE]
  }
  tags = {
    Name = "grafana-project_sg"
  }
}






resource "aws_security_group" "rds-db-mysql_sg" {
  vpc_id      = aws_vpc.tcc-project.id
  name        = "rds-db-mysql_sg"
  description = "rds-db-mysql_sg"

  ingress {
    description = "MYSQL port"
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "rds-db-mysql_sg"
  }
}







resource "aws_security_group" "ansible-project_sg" {
  vpc_id      = aws_vpc.tcc-project.id
  name        = "ansible-project_sg"
  description = "ansible-project_sg"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "SSH Anywhere"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.MYANYWHERE]
  }
  tags = {
    Name = "ansible-project_sg"
  }
}