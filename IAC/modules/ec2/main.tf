resource "aws_instance" "jumServer" {
  ami                    = var.ami_id
  instance_type          = var.instance_type[0]
  key_name               = var.key_name
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [aws_security_group.jumServerSG.id]
  root_block_device {
    volume_type = "gp2"
    volume_size = 32
  }
  tags = {
    Name = "JumServer"
    app  = "3tier-application"
  }
}

resource "aws_security_group" "jumServerSG" {
  name        = "jumServerSG"
  description = "Security group for Jump Server"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.allowed_cidr
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = var.allowed_cidr
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
