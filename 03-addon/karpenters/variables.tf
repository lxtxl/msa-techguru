variable "aws_region" {
  description = "AWS Region"
  type        = string
  default     = "ap-northeast-2"
}

variable "environment_name" {
  description = "The name of Environment Infrastructure stack name, feel free to rename it. Used for cluster and VPC names."
  type        = string
  default     = "eks-blueprint"
}

variable "eks_admin_role_name" {
  type        = string
  description = "Additional IAM role to be admin in the cluster"
  default     = ""
}

variable "eks_cluster_endpoint" {
  type        = string
  description = "eks cluster endpoint"
}
variable "argocd_secret_manager_name_suffix" {
  type        = string
  description = "Name of secret manager secret for ArgoCD Admin UI Password"
  default     = "argocd-admin-secret"
}

variable "cluster_certificate_authority_data" {
  type        = string
  description = "eks cluster certificate autoority data"
}

variable "eks_cluster_id" {
  type        = string
  description = "eks cluster id"
}

variable "oidc_provider_arn" {
  type        = string
  description = "eks oidc provider arn"
}

variable "nodegroup_iam_role_arn" {
  type        = string
  description = "nodegroup iam role arn"
}

variable "karpenter_chart_version" {
  description = "Karpenter Helm chart version to be installed"
  type        = string
}

variable "karpenter_provisioner" {
  type = list(object({
    name              = string
    instance-family = list(string)
    instance-size     = list(string)
    topology  = list(string)
    labels           = optional(map(string))
    taints = optional(object({
      key    = string
      value  = string
      effect = string
    }))
  }))
}

variable "component" {
  description = "component"
  type        = string
}

variable "environment" {
  description = "environment"
  type        = string
}