#!/bin/bash

# Exit on any error
set -e

sudo /opt/google-cloud-sdk/bin/gcloud container clusters get-credentials dfollereau-cluster
sudo /opt/google-cloud-sdk/bin/gcloud docker push us.gcr.io/${PROJECT_NAME}/dfollereau-cppserver
#sudo chown -R ubuntu:ubuntu /home/ubuntu/.kube
#kubectl patch deployment dfollereau-docker-cpp -p '{"spec":{"template":{"spec":{"containers":[{"name":"dfollereau-docker-cpp","image":"us.gcr.io/acs-dev/dfollereau-cppserver:'"$CIRCLE_SHA1"'"}]}}}}'
kubectl run dfollereau-node --us.gcr.io/${PROJECT_NAME}/dfollereau-cppserver:$CIRCLE_SHA1 --port=8080
kubectl expose deployment dfollereau-node --type="LoadBalancer"
kubectl get service dfollereau-node
