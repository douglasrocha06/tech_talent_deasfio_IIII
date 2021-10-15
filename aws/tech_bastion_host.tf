#Acesso bastion host
resource "aws_instance" "bastion_host_dl" {
  ami           = "${var.ami_bastion}"
  instance_type = "${var.type_machine_bastion}"
  availability_zone = "${var.az_bastion}"
  key_name = "${var.key_name_bastion}"
  
  subnet_id = aws_subnet.public_dl_1a.id
  associate_public_ip_address = true
  security_groups = [aws_security_group.public-sec-dl.id]

 
 connection {
    type        = "${var.type_connection_bastion}"
    user        = "${var.user_connection_bastion}"
    private_key = file("/home/douglasrocha06/.ssh/douglas-acesso")
    host        = self.public_dns
  }
  provisioner "file" {
    source      = "${var.source_provisioner_bastion}"
    destination = "${var.destination_provisioner_bastion}"
  }
  provisioner "file" {
    source      = "${var.source_script_sql_bastion}"
    destination = "${var.destination_script_sql_bastion}"
  }
  provisioner "remote-exec"{
      inline = [
        "sudo apt-get update",
        "chmod 700 douglas-acesso",
        "sudo apt install mysql-client-core-8.0",
        "mysql -h dlbanco.cxycaymkd24m.us-east-1.rds.amazonaws.com -P 3306 -u admin -p12345678 < script.sql"
      ]
  }
  tags = {
    Name = "bastion_host_dl"
  }
  depends_on = [aws_db_instance.dlbanco]
  
  root_block_device {
      volume_size = 8
      delete_on_termination = true
    }
}

