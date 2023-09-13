aws_region          = "ap-northeast-2"
environment_name     = "eks-blueprint-msk"

vpc_id              = "vpc-04998206b2d7d2b2e"
subnets             = ["subnet-098316d90c6d2f922", "subnet-06e88195409d5e8ac", "subnet-07a03caeab29fccd9"]

kafka_version       = "2.6.2"
broker_type         = "kafka.t3.small"