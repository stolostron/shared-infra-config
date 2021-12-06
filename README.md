# Shared Infrastructure Configuration-as-Code

This repository contains configuration for our Shared Infrastructure Cluster - known as "collective" - to be loaded as an ArgoCD/OpenShift GitOps application!

## Deployment Prereqs

The [prereqs](./prereqs) folder at the top-level holds some deployment pre-req configurations for ArgoCD's deployment on the target cluster (including RBAC and resource sizing modifications) as well as a ClusterRoleBinding which will allow the ArgoCD service account to carry out application deployments on the cluster.  These are handily stored for easy access when running test deploys of the various applications in this repo - or even production re-deploys!  

## Contributing/Adding Configuration

If you're adding configuration, please **make sure that you add a new folder for new squads/namespaces or place artifacts for existing squads/namespaces according to the mapping in the [consumers list](#Consumers)**.  If you *add a new squad/namespace*, please make sure that you **update the [consumers list](#Consumers)**.  

Once you've drafted your changes, please open a PR and contact ACM CICD.  

## This Repo Contains Multiple Apps

This repo contains multiple applications.  ArgoCD does not support kustomize in recursive mode, so some applications based on Kustomize have to exist as their own standalone apps.  

We'll attempt to keep a list of active applications and links to their documentation here:
* RBAC - stored in the RBAC folder, no readme
* Operators/ansible-automation-platform - [README](./operators/ansible-automation-platform/README.md)
* cluster-artifacts - Empty placeholder for ClusterImageSets and ClusterPools

## Consumers

Below is a mapping of consumer RBAC groups to namespaces.  These namespaces are not yet federated by this repository.  
```
namespace-to-groups:
  - namespace: acm-grc-security
    groups:
    - policy-grc
    - policy-grc-admins
  - namespace: acm-observability-china
    groups:
    - Core-Services
  - namespace: acm-observability-usa
    groups:
    - Search
    - Search-Admin
  - namespace: app
    groups:
    - AppLifecycle
    - AppLifecycle-Admins
  - namespace: cicd
    groups:
    - CICD
  - namespace: cluster-lifecycle
    groups:
    - cluster-lifecycle-admin
    - cluster-lifecycle-team
  - namespace: console-squad
    groups:
    - console
  - namespace: far-edge
    groups:
    - far-edge
  - namespace: install
    groups:
    - Installer
    - installer-admin
  - namespace: kui-web-terminal
    groups:
    - squad-kui
    - squad-kui-Admins
  - namespace: managed-services
    groups:
    - managed-services
  - namespace: qe
    groups:
    - acm-qe
    - acm-qe-admin
    - qe
  - namespace: server-foundation
    groups:
    - Server Foundation
    - Server Foundation Admins
  - namespace: submariner
    groups:
    - submariner
```
