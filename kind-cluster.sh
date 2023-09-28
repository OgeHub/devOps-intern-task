#!/bin/bash

# Kind cluster name
KIND_CLUSTER_NAME="devops-task-kind-cluster"

# Check if Kind is installed
if ! command -v kind &> /dev/null; then
  echo "Kind is not installed."
  exit 1
fi

# Check if the cluster already exists
if kind get clusters | grep -q "$KIND_CLUSTER_NAME"; then
  echo "Kind cluster '$KIND_CLUSTER_NAME' already exists."
  exit 1
fi

# Create a Kind cluster
kind create cluster --name "$KIND_CLUSTER_NAME" --image "kindest/node:v1.28.0"

# Comfirm that the cluster is running
kind get clusters

echo "'$KIND_CLUSTER_NAME' is running."
