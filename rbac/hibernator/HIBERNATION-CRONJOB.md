# How RBAC works for the Hibernator-cronjobs

Access control is obtained by leveraging the ManagedClusterSets. When a cluster is created with a ClusterClaim, which includes a ManagedClusterSet label, a ClusterRole is created and bound to `system:serviceaccounts:NAMESPACE` where NAMESPACE is where the ClusterClaim was created.  This allows the hiberantor service account in the NAMESPACE to modify the hibernation state of the ClusterDeployment in question.
