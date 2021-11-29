#!/bin/sh

set -e

sh -c "aws configure set region ${aws-region}"
sh -c "aws configure set aws_access_key_id ${aws-access-key-id}"
sh -c "aws configure set aws_secret_access_key ${aws-secret-access-key}"
sh -c "aws eks update-kubeconfig --region ${aws-region} --name ${cluster-name}"

#Debug
sh -c "ls -alrt"
sh -c "cat $HOME/.aws/credentials"
sh -c "cat $HOME/.kube/config"


# Extract the base64 encoded config data and write this to the KUBECONFIG
echo "$KUBECONFIG_SECRET" | base64 -d > /tmp/config
export KUBECONFIG=/tmp/config
sh -c "kubectl get nodes"

sh -c "kubectl $*"
