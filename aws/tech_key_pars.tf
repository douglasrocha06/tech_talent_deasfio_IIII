resource "aws_key_pair" "douglas-acesso" {
  key_name   = "${var.key_name}"
  public_key = "${var.public_key}"
  tags = {
    "Name" = "douglas-acesso"
  }
}