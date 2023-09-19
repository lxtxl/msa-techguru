#!/bin/bash
# efs csi 설치법 : https://docs.aws.amazon.com/ko_kr/eks/latest/userguide/efs-csi.html
# addon 설치법 : https://docs.aws.amazon.com/ko_kr/eks/latest/userguide/managing-add-ons.html#creating-an-add-on
source ../env.sh

EFS_POLICY_NAME=AmazonEKS_EFS_CSI_Driver_Policy
EFS_ROLE_NAME=AmazonEKS_EFS_CSI_DriverRole
# =================================================
if ! command -v eksctl &>/dev/null ;then
    echo "Not installed eksctl"
    exit 1
fi

curl -O https://raw.githubusercontent.com/kubernetes-sigs/aws-efs-csi-driver/master/docs/iam-policy-example.json

POLICYARN_EXIST=$(aws iam list-policies --query 'Policies[?PolicyName==`AmazonEKS_EFS_CSI_Driver_Policy`].{ARN:Arn}' --output text | wc -l)
echo "POLICYARN_EXIST: ${POLICYARN_EXIST}"

if [ ${POLICYARN_EXIST} == 0 ];then
    aws iam create-policy \
        --policy-name ${EFS_POLICY_NAME} \
        --policy-document file://iam-policy-example.json
fi
# version check
# eksctl utils describe-addon-versions --kubernetes-version 1.27 --name aws-efs-csi-driver | grep AddonVersion | python3 -mjson.tool

eksctl create iamserviceaccount \
    --name efs-csi-controller-sa \
    --namespace kube-system \
    --cluster ${EKS_CLUSTER_NAME} \
    --role-name ${EFS_ROLE_NAME} \
    --role-only \
    --attach-policy-arn arn:aws:iam::aws:policy/service-role/AmazonEFSCSIDriverPolicy \
    --approve

TRUST_POLICY=$(aws iam get-role --role-name ${EFS_ROLE_NAME} --query 'Role.AssumeRolePolicyDocument' | \
    sed -e 's/efs-csi-controller-sa/efs-csi-*/' -e 's/StringEquals/StringLike/')
aws iam update-assume-role-policy --role-name ${EFS_ROLE_NAME} --policy-document "${TRUST_POLICY}"

eksctl create addon --cluster ${EKS_CLUSTER_NAME} \
    --name aws-efs-csi-driver \
    --version v1.5.8-eksbuild.1 \
    --service-account-role-arn arn:aws:iam::${EKS_ACCOUNT_ID}:role/${EFS_ROLE_NAME} --force