resource "aws_db_subnet_group" "db_subnet_group" {
  name       = "tcc-db-subnet-group"
  subnet_ids = [aws_subnet.tcc-pub-1.id, aws_subnet.tcc-pub-2.id]
}


resource "aws_db_instance" "db-temperatura" {
  identifier             = "db-temperatura"
  engine                 = "mysql"
  instance_class         = "db.t2.micro"
  allocated_storage      = 20
  storage_type           = "gp2"
  db_subnet_group_name   = aws_db_subnet_group.db_subnet_group.name
  vpc_security_group_ids = [aws_security_group.rds-db-mysql_sg.id]
  username               = "myuser"
  password               = "mypassword"

}

output "DB-Public-IP" {
  value = aws_db_instance.db-temperatura.endpoint
}