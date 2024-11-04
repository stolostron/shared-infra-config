#!/bin/bash

CSV_NAME=$(oc get csv -n openshift-operators | grep cert-manager | awk '{print $1}')
CSV_VERSION=$(oc get csv -n openshift-operators $CSV_NAME -o jsonpath='{.spec.version}')
echo "$CSV_VERSION"
oc patch clusterserviceversion cert-manager.v$CSV_VERSION \
    --type=json \
    -n openshift-operators \
    --patch='[{"op":"add","path":"/spec/install/spec/deployments/0/spec/template/spec/containers/0/args/-","value":"--dns01-recursive-nameservers-only"},{"op":"add","path":"/spec/install/spec/deployments/0/spec/template/spec/containers/0/args/-","value":"--dns01-recursive-nameservers=8.8.8.8:53,1.2.3.4:53"}]'
