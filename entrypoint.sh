#!/bin/sh

set -e

# Extract the base64 encoded config data and write this to the KUBECONFIG
echo "$KUBECONFIG_SECRET" | base64 -d > /tmp/config
export KUBECONFIG_SECRET=/tmp/config

sh -c "kubectl $*"
