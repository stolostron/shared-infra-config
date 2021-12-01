# Creating the Pre-Requisite S3 Secret for AAP Hub

The Ansible Automation Platform AutomationHub component requires a RWX storage type.  In our implementation we'll use S3.  To avoid putting secrets in GitHub (or fiddling with the various means to deliver secrets via OpenShift GitOps from GitHub), we have this folder of pre-reqs to create the secret for S3 on the target cluster.  

To prepare for the rollout of this operator to the cluster, you need to do the following:
1. Log in to the cluster where you wish to deploy this app (to deploy AAP with AutomationHub).  
2. `cp env.secret.example env.secret` and fill out the details.  Create an S3 bucket in the account pointed to by the access keys with default settings.  
3. `oc apply -k .` in this folder to create the secret and take note of the secret name.
4. Update `../automationhub.yaml`'s s3 secret name to the created secret's name and commit back to your working version of this repo.  
