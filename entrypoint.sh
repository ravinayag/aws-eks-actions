#!/bin/sh

set -e

sh -c "aws configure set region ${AWS_REGION}"
sh -c "aws configure set aws_access_key_id ${AWS_ACCESS_KEY_ID}"
sh -c "aws configure set aws_secret_access_key ${AWS_SECRET_ACCESS_KEY}"
sh -c "aws eks update-kubeconfig --region ${AWS_REGION} --name ${CLUSTER_NAME}"


# Extract the base64 encoded config data and write this to the KUBECONFIG
echo "$KUBECONFIG_SECRET" | base64 -d > /tmp/config
export KUBECONFIG=/tmp/config

sh -c "kubectl $*"