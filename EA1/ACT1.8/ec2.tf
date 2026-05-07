resource "aws_key_pair" "mi_key" {
  key_name   = "mi_key_name"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDiuFUssdtHg8Y3rWGZFCSD58hSr4IqjFVKeid9d0G3bk7w99/AOyL/C45PnFodjOtD1eMndiCd40BqagdOYtKoieqlOTlmShrvE7N2A+MeaOP4CWLx7fj2MfekecPPFRAiMUCZk51SHxFr4oqX4Qhj8BkG1cG30p9QB+stfJKT3tUGczxUB1aor9qoLmPDTfaE4iSmNDscVmqQhX9jkppdzkg2ENh5cDO2EtLlHHxIodXLgetpWjBP68r90q/gwZV69XANcTWjZiZRyDmb9nIfQiZOO5C03FoG0GmTSZkAfvZdq7M2GsQSboln44VW/ukyQKFRVVepOCIHTaqcsjhV"
}

resource "aws_security_group" "ssh_access" {
  name        = "ssh-access"
  description = "Permitir acceso SSH solo desde la red interna de la VPC"
  vpc_id      = aws_vpc.mi_vpc.id

  ingress {
    description = "SSH solo desde la VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.mi_vpc.cidr_block]
  }

  egress {
    description = "Permitir salida HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Permitir salida HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "ssh-access"
  }
}

resource "aws_iam_role" "ec2_role" {
  name = "act1-8-ec2-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_instance_profile" "ec2_profile" {
  name = "act1-8-ec2-profile"
  role = aws_iam_role.ec2_role.name
}

resource "aws_instance" "mi_ec2" {
  ami                    = "ami-012967cc5a8c9f891"
  instance_type          = "t3.micro"
  key_name               = aws_key_pair.mi_key.key_name
  subnet_id              = aws_subnet.subnet_privada_1.id
  vpc_security_group_ids = [aws_security_group.ssh_access.id]
  iam_instance_profile   = aws_iam_instance_profile.ec2_profile.name
  monitoring             = true
  ebs_optimized          = true

  metadata_options {
    http_endpoint               = "enabled"
    http_put_response_hop_limit = 1
    http_tokens                 = "required"
  }

  root_block_device {
    encrypted = true
  }

  tags = {
    Name = "MiInstancia"
  }
}