#instancia rds
resource "aws_db_instance" "dlbanco" {
  allocated_storage      = 10
  max_allocated_storage  = 11
  engine                 = "${var.engine_rds}"
  engine_version         = "${var.version_rds}"
  instance_class         = "${var.type_machine_rds}"
  name                   = "${var.name_rds}"
  username               = "${var.username_rds}"
  password               = "${var.password_rds}"
  db_subnet_group_name   = aws_db_subnet_group.dl_dbgroup.id
  vpc_security_group_ids = [aws_security_group.sg_db_dl.id, aws_security_group.sg_ssh_dl.id]
  skip_final_snapshot    = true
  multi_az   = true
  identifier = "dlbanco"
  tags = {
    Name = "dlbanco"
  }
}

#grupo rds - configuração das subnets
resource "aws_db_subnet_group" "dl_dbgroup" {
  name       = "dl_dbgroup"
  subnet_ids = [aws_subnet.privatedb_dl_1a.id, aws_subnet.privatedb_dl_1c.id]

  tags = {
    Name = "dl_dbgroup"
  }
}