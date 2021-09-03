# Shared Infrastructure Configuration-as-Code

This repository contains configuration for our Shared Infrastructure Cluster - known as "collective" - to be loaded as an ArgoCD/OpenShift GitOps application!

## Consumers

Below is a mapping of consumer RBAC groups to namespaces.  These namespaces are not yet federated by this repository.  
```
namespace-to-groups:
  - namespace: qe
    groups:
    - acm-qe
    - acm-qe-admin
    - qe
  - namespace: app
    groups:
    - AppLifecycle
    - AppLifecycle-Admins
  - namespace: cluster-lifecycle
    groups:
    - cluster-lifecycle-admin
    - cluster-lifecycle-team
  - namespace: install
    groups:
    - Installer
    - installer-admin
  - namespace: acm-observability-usa
    groups:
    - Search
    - Search-Admin
  - namespace: server-foundation
    groups:
    - Server Foundation
    - Server Foundation Admins
  - namespace: kui-web-terminal
    groups:
    - squad-kui
    - squad-kui-Admins
  - namespace: acm-observability-china
    groups:
    - Core-Services
  - namespace: acm-grc-security
    groups:
    - policy-grc
    - policy-grc-admins
  - namespace: far-edge
    groups:
    - far-edge
  - namespace: cicd
    groups:
    - CICD
  - namespace: submariner
    groups:
    - submariner
  - namespace: console-squad
    groups:
    - console
  - namespace: managed-services
    groups:
    - managed-services
  - namespace: acm-observability-china
    groups:
    - Core-Services
```
