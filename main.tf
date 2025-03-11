resource "aws_security_group" "wordpress-sg" {
  name        = "wordpress-sg"
  description = "Security group for WordPress instances"
  vpc_id      = var.vpc_id
  ingress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 9443
    to_port     = 9443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 7080
    to_port     = 7443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8000
    to_port     = 9000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

module "ec2" {
  source                     = "specific repository with specific branch"
  aws_instance_name          = "ec2-${var.project}-${var.environment}-${var.customer}"
  aws_ami_id                 = var.ami_id
  aws_instance_type          = var.instance_type
  aws_key_name               = var.key_name
  aws_vpc_security_group_ids = var.security_group_ids
  aws_user_data              = local.user_data
  aws_subnet_id              = var.subnet_id
  tags = {
    Project     = var.project
    Environment = var.environment
    customer    = var.customer
    Name        = "${var.customer}-${var.environment}-${var.project}"
  }
  disk_size             = var.disk_size
  volume_type           = var.volume_type
  delete_on_termination = var.delete_on_termination
}
