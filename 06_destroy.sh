#!/bin/sh
set -o xtrace
source .env
gcloud container clusters delete $GCP_GKE_NAME