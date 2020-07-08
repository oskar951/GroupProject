resource "aws_db_subnet_group" "subnet_db" {
  name       = "main"
  subnet_ids = [var.subnetA, var.subnetB]

  tags = {
    Name = "My DB subnet group"
  }
}

resource "aws_db_instance" "rds_instance" {
  allocated_storage      = var.storage
  storage_type           = var.storage_type
  engine                 = var.engine
  engine_version         = var.engine_version
  instance_class         = var.instance_class
  name                   = var.instance_name
  username               = var.username
  password               = var.password
  parameter_group_name   = var.parameter_group
  vpc_security_group_ids = [var.vpc_sg_id]
  db_subnet_group_name   = aws_db_subnet_group.subnet_db.id
  skip_final_snapshot    = var.skip_final_ss
  identifier             = var.db_identifier
  publicly_accessible    = true
}