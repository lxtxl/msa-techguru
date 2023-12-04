output "eks_cluster_id" {
  description = "The name of the EKS cluster."
  value       = module.eks_cluster.eks_cluster_id
}

output "configure_kubectl" {
  description = "Configure kubectl: make sure you're logged in with the correct AWS profile and run the following command to update your kubeconfig"
  value       = module.eks_cluster.configure_kubectl
}

output "eks_cluster_name" {
  description = "The name of the EKS cluster."
  value       = module.eks_cluster.eks_cluster_id
}

output "eks_cluster_oidc_arn" {
  description = "eks oidc provider arn"
  value       = module.eks_cluster.eks_cluster_oidc_arn
}

output "eks_cluster_endpoint" {
  description = "eks cluster endprint"
  value       = module.eks_cluster.eks_cluster_endpoint
}

output "cluster_certificate_authority_data" {
  description = "eks cluster certificate autority data"
  value       = module.eks_cluster.cluster_certificate_authority_data
}

output "eks_managed_node_groups" {
  description = "eks managed nodegroup"
  value       = module.eks_cluster.eks_managed_node_groups
}

