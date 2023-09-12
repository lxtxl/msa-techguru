provider "aws" {
  region = var.aws_region
}

module "msk-kafka-cluster" {
  source  = "terraform-aws-modules/msk-kafka-cluster/aws"

  name                   = var.environment_name
  kafka_version          = "3.4.0"
  number_of_broker_nodes = 3
  enhanced_monitoring    = "PER_TOPIC_PER_PARTITION"

  broker_node_client_subnets = var.subnets
  broker_node_storage_info = {
    ebs_storage_info = { volume_size = 100 }
  }
  broker_node_instance_type   = "kafka.t3.small"
  broker_node_security_groups = [var.sg_name]

  configuration_name        = "example-configuration"
  configuration_description = "Example configuration"
  configuration_server_properties = {
    "auto.create.topics.enable" = true
    "delete.topic.enable"       = true
  }

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}