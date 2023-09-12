variable "aws_region" {
  description = "AWS Region"
  type        = string
  default     = "ap-northeast-2"
}

variable "environment_name" {
  description = "msk name"
  type        = string
  default     = "blueprint-msk"
}

variable "sg_name" {
  description = "Security Group Name"
  type        = string
}

variable "subnets" {
  description = "Security Group Name"
  type        = list(string)
}

