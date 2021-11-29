#!/bin/sh

set -e

sh -c "aws configure set region ${aws_region}"
sh -c "aws configure set aws_access_key_id ${aws_access_key_id}"
sh -c "aws configure set aws_secret_access_key ${aws_secret_access_key}"
sh -c "aws eks update-kubeconfig --region ${aws_region} --name ${cluster_name}"

#Debug
sh -c "ls -alrt"
sh -c "cat $HOME/.aws/credentials"
sh -c "cat $HOME/.kube/config"


# Extract the base64 encoded config data and write this to the KUBECONFIG
echo "$KUBECONFIG_SECRET" | base64 -d > /tmp/config
export KUBECONFIG=/tmp/config
sh -c "kubectl get nodes"

sh -c "kubectl $*"
