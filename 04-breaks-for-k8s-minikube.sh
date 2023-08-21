#!/bin/bash

# set -x #echo on
GREEN='\033[0;32m' # Green
NC='\033[0m' # No Color
config_file=~/.minikube/config/config.json

printf "\n\n\n"
printf "Is${GREEN} Minikube${NC} installed?"
printf "\n\n\n"

# Check if Minikube is installed
if ! command -v minikube &> /dev/null; then
    echo "Minikube is not installed. Please install Minikube first."
    exit 1
fi

printf "\n\n\n"
printf "Does the${GREEN} confg.json file${NC} exist?"
printf "\n\n\n"

# Check if config file exists
if [ ! -f "$config_file" ]; then
    echo "Minikube config file not found. Please run 'minikube start' to create the config file."
    exit 1
fi

# Update the config file with desired settings
echo "Updating Minikube config..."
jq '.KubernetesConfig.Memory = "1024"' "$config_file" > tmpfile && mv tmpfile "$config_file"
jq '.KubernetesConfig.CPUs = "1"' "$config_file" > tmpfile && mv tmpfile "$config_file"

printf "\n\n\n"
printf "${GREEN}Minikube Config Updated Successfully${NC}"
printf "\n\n\n"

# Here we are restarting Minikube so that the changes that we just made can take effect

printf "\n\n\n"
printf "${GREEN}Stopping Minikube${NC}"
printf "\n\n\n"
minikube stop --all

read -t 5 -p "Pausing for 5-seconds before starting Minikube again."

printf "\n\n\n"
printf "${GREEN}Starting Minikube${NC}"
printf "\n\n\n"
minikube start

# Here you can check for the url again, so that you can see what the change is that has been made
minikube kubectl -- get pods -A
minikube service my-release-wordpress --url

# So far the default is still running fine.
# Build the helm chart to link to a namespace for this demo



# This is the part where you can start looking at what could be wrong with the installation
#########################---BUSY DEBUGGING
exit 1
