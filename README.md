# Argo Workflows with Hera

Hera is a Python framework for constructing and submitting Argo Workflows.

This a tool for Machine Learning engineers to experiment,develop and orchestrate their workflows locally using `Python` and `Argo Workflows`

## Prerequisites

To run this project, you will need to have the following installed:

[Devbox](https://www.jetpack.io/devbox/docs/) || [Docker Desktop](https://www.docker.com/products/docker-desktop/)

---

> [!NOTE]
> Development environments created by Devbox are isolated and portable.
> No version conflicts, no need to install anything on your host machine.

---

## Quick Start

```bash
 git clone https://github.com/J0hn-B/hera_argo.git && cd hera_argo
```

```bash
# Start a new shell to install the project dependencies
devbox shell
```

```bash
# Deploy and configure Argo Workflows on a local k3d cluster, and get the Argo Workflows UI URL
task deploy

```

---

## How to use

```bash
# Install the project dependencies

cd $PWD/src/mlops && poetry install
```

```bash
# Run the example workflows
 poetry run python main.py
```

- Check the `src/mlops/main.py` file and `src/mlops/mlops` folder for the example workflows.

---

![image](https://github.com/J0hn-B/hera_argo/assets/40946247/498e4916-88ff-4a12-a343-9075f76ac080)

---

```bash
# Access the k3d cluster using kubectl from another terminal

cd hera_argo && devbox shell
```

```bash
# Deploy a yaml example workflow using argo cli

argo submit --watch src/mlops_yaml/first.yaml
```

- Permissions:

  ```dir
  hera_argo/kubernetes/cluster/overlays/k3d/kustomization.yaml
  ```

  ```yaml
  # Resources to apply
  resources:
    ###?  dir contains config files for a service account with custom permissions.    Uncomment to apply/adjust/modify based on your needs.
    #- ../../base

    ###? file contains a role binding for the default service account in the argo    namespace with admin permissions. NOT recommended for production use.
    - default_admin.yaml
  ```

---

## Clean up

```bash
# Delete the cluster
task delete
```

```bash
# Exit the shell
exit
```

```bash
# Clean up packages installed by devbox
nix-collect-garbage
```
