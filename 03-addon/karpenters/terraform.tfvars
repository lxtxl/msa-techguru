aws_region          = "ap-northeast-2"
environment_name     = "eks-blueprint"

eks_admin_role_name = "WSParticipantRole"

eks_cluster_endpoint  = "https://2E94E268F317D61243507CBC77EE84FD.yl4.ap-northeast-2.eks.amazonaws.com"
cluster_certificate_authority_data = "LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSURCVENDQWUyZ0F3SUJBZ0lJWkROOEFnSHpNckl3RFFZSktvWklodmNOQVFFTEJRQXdGVEVUTUJFR0ExVUUKQXhNS2EzVmlaWEp1WlhSbGN6QWVGdzB5TXpFd016QXhOREkyTVRWYUZ3MHpNekV3TWpjeE5ETXhNVFZhTUJVeApFekFSQmdOVkJBTVRDbXQxWW1WeWJtVjBaWE13Z2dFaU1BMEdDU3FHU0liM0RRRUJBUVVBQTRJQkR3QXdnZ0VLCkFvSUJBUURrTUVDUSsxSXl1UDFaSFZ6UlZldGtma2xXSGlENHdpNExMSUlIdVg2Zk9uUWQ1TnNJOTNmZ2c3TFUKcndRd0dESEdxeDRMSmtXVWxoUjZCR2V3emRIQzgvT1ZoODZSMEhCcHFuYjN4aW1hZWZmeDFtclY4dElFVnZlZApnWk9LYmFLNStveFoxZjBHUExHaTlMRWt6Z0RyWjJEWEQxZHRMVVB6bGtYMGx0Z0lxdWNnV3dVY2NVUndDZ3JlCmg3cWUxeXRJenUwbm42KzRoOFVnRkdXdnBoNDhQZkRZZVpEcTFubVp2Z0VaYndTekIwNVVSQW5EckpxSFJnMFQKTm5yVXhJRWk5U21GRjBOWjVKY1hrWVptd2RERFhrS2dySU1udUxvai9pcUFBb2R3R29CZWNybEpvQkhUWDdIOAo4WVBkbXNoWVlyOVhlRHh0cTgvT1d0V0gvcGFKQWdNQkFBR2pXVEJYTUE0R0ExVWREd0VCL3dRRUF3SUNwREFQCkJnTlZIUk1CQWY4RUJUQURBUUgvTUIwR0ExVWREZ1FXQkJUUlQ3UGJFUGlKWDVXZjY2OENnY3pvNFNnUkVUQVYKQmdOVkhSRUVEakFNZ2dwcmRXSmxjbTVsZEdWek1BMEdDU3FHU0liM0RRRUJDd1VBQTRJQkFRQzVSS3pQcGg5bApzWU5zbGp0UHZNQjJhWG1LQmdEcUdNN0o4amtaR1poWE5FYU5xRk5XN01CWkVRNG45U3dWdG4wdXNtUUU1VFM3CmlnVjFjTjA2a2orczZ5YnZDSzBKbEVNMmNZTWNHbDdmUE10ZHYxenQvMkM2T1p2QlRLbU5yeVNoQW5sZndnOVcKRzNsdGczbmtQeVpMN3hOeGZiTjNZL2hRU0JXUzdtNmlHTFg3dFNXcWwwMkhncGVrd2gxUE5XRFhtYzAxN0FhYwo0TVZpOWRDazR4ekNtSWZWbzB2REZpbjRGYXZHa3dZZndWZmhTYUxabysyc3VVSGkwbTZmN3hSZXM1aEFXbWhkCkYyMXlrRzQxVkJGSk9GNHdtZjZuZDl6OG92eVFSYnY1VlpzNHZaM3lacHRhMHBreitiMytFenFZOHpFUEN2c0kKOFU4RDNzd1ByQjRZCi0tLS0tRU5EIENFUlRJRklDQVRFLS0tLS0K"
eks_cluster_id        = "eks-blueprint-blue"

oidc_provider_arn     = "arn:aws:iam::739999085319:oidc-provider/oidc.eks.ap-northeast-2.amazonaws.com/id/2E94E268F317D61243507CBC77EE84FD"
nodegroup_iam_role_arn = "arn:aws:iam::739999085319:role/initial-eks-node-group-20231030142647812700000003"

karpenter_chart_version = "v0.30.0"

karpenter_provisioner = {
  name              = "default"
  instance-family =  ["m5"]
  instance-size     = ["small", "medium", "large"]
  topology  = ["ap-northeast-2a", "ap-northeast-2b", "ap-northeast-2c"]
  labels            = {
    created-by  = "karpenter"
  }
}

component = "component"
environment = "environment"