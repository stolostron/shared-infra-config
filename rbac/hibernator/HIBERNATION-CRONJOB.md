# How RBAC works for the Hibernator-cronjobs

1. Access control is obtained by leveraging the ManagedClusterSets. When a cluster is created with a ClusterClaim, which includes a ManagedClusterSet label, a ClusterRole is created and bound to `system:serviceaccounts:NAMESPACE` where NAMESPACE is where the ClusterClaim was created.  This allows the hiberantor service account in the NAMESPACE to modify the hibernation state of the ClusterDeployment in question.

2. You must add the `system:serviceacounts:NAMESPCE` subject to the `/rbac/clusterdeployments.view/clusterdeployments.view/clusterrolebinding.yaml`

3. You must add the `system_serviceaccounts:NAMESPACE` subject to the `/rbac/events.create.update.view/events.create.update.view.yaml`
