variable "aws_region" {
  type = string
  default = "us-east-1"
  description = "The AWS region where to provision the resources."
}

variable "vpc_id" {
  default = "vpc-db10ffa6"
}

variable "subnet_ids" {
  type = list(string)
  default = [
    "subnet-5c690b11",
    "subnet-14ae714b",
    "subnet-db28fbbd",
    "subnet-50f7635e",
    "subnet-82f029a3",
    "subnet-3c28ce0d",
  ]
}