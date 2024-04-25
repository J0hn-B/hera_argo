#!/usr/bin/env bash
# This script is used to create a k3d cluster

# Variables
CLUSTER_NAME=${CLUSTER_NAME:-kubepal}

# Create a k3d cluster
function create() {
    # Check if docker desktop is running
    if ! docker info >/dev/null 2>&1; then
        echo ""
        echo "Docker Desktop is not running. Please start Docker Desktop and try again."
        exit 1
    fi

    # Check if k3d cluster exists
    if k3d cluster list $CLUSTER_NAME >/dev/null 2>&1; then
        echo 'cluster already exists'
    else
        # Create a k3d cluster
        k3d cluster create $CLUSTER_NAME --api-port 6443 --port 8082:80@loadbalancer --port 8083:443@loadbalancer --agents 1

        # Wait for the api services to become available
        kubectl wait --for=condition=Available apiservice --all --timeout=300s
    fi
}

# Delete a k3d cluster
function delete() {
    # Check if k3d cluster exists
    if k3d cluster list $CLUSTER_NAME; then
        # Delete a k3d cluster
        k3d cluster delete $CLUSTER_NAME
    else
        echo 'cluster does not exist'
    fi
}
