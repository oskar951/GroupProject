resource "aws_instance" "Webserver" {
  ami                    = var.ubuntu-ami
  instance_type          = var.instance-type
  key_name               = var.pem-key
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [var.vpc_security_group_ids]
  iam_instance_profile   = var.iam_instance_profile
  user_data = "${file("../scripts/installjenkins.sh")}"
  associate_public_ip_address = var.associate_public_ip_address

  lifecycle {
    create_before_destroy = true
  }

  tags = {
    Name = var.name_tag
  }
}

###################### WORKER NODES ######################