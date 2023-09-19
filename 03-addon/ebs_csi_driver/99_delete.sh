#!/bin/bash

source ../env.sh

eksctl delete iamserviceaccount \
    --name ebs-csi-controller-sa \
    --cluster ${EKS_CLUSTER_NAME} \
    --namespace kube-system