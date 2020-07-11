provider "aws" {
  region = var.aws_region
  profile = "django_terraform"
}

locals {
  app_name = "django-terraform"
  app_environment = terraform.workspace
  name_prefix = "${local.app_name}-${local.app_environment}"
  db_instance_class = "db.t2.micro"
}