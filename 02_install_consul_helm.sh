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