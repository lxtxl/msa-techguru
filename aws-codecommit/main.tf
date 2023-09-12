provider "aws" {
  region = var.aws_region
}

resource "aws_codecommit_repository" "order-service" {
  repository_name = "test-order-service"
  description     = "order service codecommit"
}

resource "aws_codecommit_repository" "customer-service" {
  repository_name = "test-customer-service"
  description     = "customer service codecommit"
}