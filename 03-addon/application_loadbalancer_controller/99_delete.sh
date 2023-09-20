#!/bin/bash

source ../env.sh

helm uninstall aws-load-balancer-controller -n kube-system

eksctl delete iamserviceaccount \
    --name aws-load-balancer-controller \
    --cluster ${EKS_CLUSTER_NAME} \
    --namespace kube-system