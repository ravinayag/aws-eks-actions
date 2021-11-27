#!/bin/sh

set -e

export AWS_ACCESS_KEY_ID="$AWS_ACCESS_KEY_ID"
export AWS_SECRET_ACCESS_KEY="$AWS_SECRET_ACCESS_KEY"

echo "aws version"
aws --version

echo "Update kubeconfig for aws"
aws eks --region "$AWS_REGION" update-kubeconfig --name "$CLUSTER_NAME"
kubectl "$@"