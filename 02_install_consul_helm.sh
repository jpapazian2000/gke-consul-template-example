#!/bin/sh
set -o xtrace
source .env
context="gke_${GCP_PROJECT}_${GCP_COMPUTE_ZONE}_${GCP_GKE_NAME}"
kubectl config use-context $context
kubectl create namespace $CONSUL_NAMESPACE

#generate the gossip encryption key
kubectl create secret generic consul-gossip-encryption-key --from-literal=key=$(consul keygen) -n $CONSUL_NAMESPACE
helm install $CONSUL_HELM_NAME hashicorp/consul -n $CONSUL_NAMESPACE -f $CONSUL_HELM_VALUES
#helm delete $CONSUL_HELM_NAME -n $CONSUL_NAMESPACE

echo "wait to get the public IP for the consul-ui service/n "
echo "Once External IP is assigned ..use a browser to check consul UI  "
echo "press ctrl+c to quit"
kubectl get svc -o wide -n $CONSUL_NAMESPACE -w
