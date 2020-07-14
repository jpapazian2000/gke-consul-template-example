#!/bin/sh
set -o xtrace
source .env
docker build -t $NGINX_CONSUL_TEMPLATE_CONTAINER_TAG .
docker push $NGINX_CONSUL_TEMPLATE_CONTAINER_TAG