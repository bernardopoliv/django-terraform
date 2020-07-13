provider "aws" {
  region = var.aws_region
  profile = "django_terraform"
}

locals {
  app_name = "django-terraform"
  app_environment = terraform.workspace
  name_prefix = "${local.app_name}-${local.app_environment}"
  db_instance_class = "db.t2.micro"

  tags = {
    app = "django_terraform"
    owner = "bernardopoliv@gmail.com"
    environment = terraform.workspace
  }
}

resource "aws_db_subnet_group" "db_subnet_group" {
  subnet_ids = var.subnet_ids
}

resource "aws_db_instance" "this" {
  identifier = "${local.name_prefix}-db"
  allocated_storage = 20
  storage_type = "gp2"
  engine = "postgres"
  engine_version = "9.5"
  instance_class = "db.t2.micro"

  db_subnet_group_name = aws_db_subnet_group.db_subnet_group.id

  skip_final_snapshot = true

  name = "django_terraform"
  username = "django"
  password = "terraform"

  lifecycle {
    ignore_changes = [
      engine_version
    ]
  }
}
