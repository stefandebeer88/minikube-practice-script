#!/bin/bash

set -x # echo on
GREEN='\033[0;32m' # Green
NC='\033[0m' # No Color

fourth_script="./04-breaks-for-k8s-minikube.sh"
printf "\n\n\n"
printf "Installing${GREEN} Wordpress HELM Chart${NC}!"
printf "\n\n\n"

# This is the Helm Chart that we are going to use == Wordpress installation
helm install my-release oci://registry-1.docker.io/bitnamicharts/wordpress

# Wait for 15mins for the helm chart to install on the cluster. Note that it may take longer as both database pod and wordpress pods need to be running with 1/1
printf "\n\n\n"
read -t 900 -p "Pausing for 15-mins before checking if all pods are in ready state. Note that this is for Wordpress and other installs may be longer or shorter in timespan."
printf "\n\n\n"
printf "Successfully ${GREEN}Installed Wordpress HELM Chart${NC}!"
printf "\n\n\n"

# Check to see if all pods are in READY state, ensure this before continuing
minikube kubectl -- get pods -A
printf "\n\n\n"
echo "Please ensure that all pods are in READY state 1/1 before running the next script."
printf "\n\n\n"
minikube service my-release-wordpress --url
printf "\n\n\n"

# You need to open the first URL and check if the deployment was successful.
# There will be two IPs on the shell, either of them will point to the WP installation.
# 'Mindblown: a blog about philosophy.' == success

# Proceed to the fourth script - responsible for breaking minikube.
if [ -f "$fourth_script" ]; then
  bash "$fourth_script"
else
  echo "The $fourth_script Does not exist"
fi

exit 1
