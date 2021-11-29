#!/bin/sh

set -xe
echo ${aws-region}:${aws-access-key-id}:${aws-secret-access-key}:${cluster-name}

echo ${AWS_REGION}:${AWS_ACCESS_KEY_ID}:${AWS_SECRET_ACCESS_KEY}:${CLUSTER_NAME}
# sh -c "aws configure set region ${aws_region}"
# sh -c "aws configure set aws_access_key_id ${aws_access_key_id}"
# sh -c "aws configure set aws_secret_access_key ${aws_secret_access_key}"
# sh -c "aws eks update-kubeconfig --region ${aws_region} --name ${cluster_name}"

sh -c "aws configure set region ${AWS_REGION}"
sh -c "aws configure set aws_access_key_id ${AWS_ACCESS_KEY_ID}"
sh -c "aws configure set aws_secret_access_key ${AWS_SECRET_ACCESS_KEY}"
sh -c "aws eks update-kubeconfig --region ${AWS_REGION} --name ${CLUSTER_NAME}"


# Extract the base64 encoded config data and write this to the KUBECONFIG
echo "$KUBECONFIG_SECRET" | base64 -d > /tmp/config
export KUBECONFIG=/tmp/config

sh -c "kubectl $*"
#sh -c "$*"
