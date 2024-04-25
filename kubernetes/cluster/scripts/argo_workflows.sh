#!/usr/bin/env bash

# Colour code variables
CYAN=$(tput setaf 6)
GREEN=$(tput setaf 2)
RESET=$(tput sgr0)

# Get the the full directory name of the script no matter where it is being called from.
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

argo_install() {
    # Install argo workflows
    kubectl apply -k $DIR/../../argo_workflows && kubectl apply -k $DIR/../overlays/k3d/

    # Wait for argo workflows deployemnt to be ready
    kubectl wait --for=condition=available --timeout=300s deployment/argo-server -n argo

    # Apply the ingress
    kubectl apply -f $DIR/../../argo_workflows/ingress.yaml
}

argo_ui() {
    # Return the url of the argo server
    echo ""
    echo "Argo Workflows UI:$GREEN http://localhost:8082/argo/"$RESET
    echo ""
}
