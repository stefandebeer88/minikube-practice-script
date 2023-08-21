#!/bin/bash

#echo on
#set -x
GREEN='\033[0;32m' # Green
NC='\033[0m' # No Color
third_script="./03-install-helm-chart-wp.sh"

# Check if Minikube is already installed, if it is not installed, it will install.
printf "\n\n\n"
printf "Is${GREEN} Minikube installed${NC}?"
printf "\n\n\n"

if ! command -v minikube &> /dev/null; then
    echo "Minikube is not installed. Installing..."

    # Install Minikube
    curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
    chmod +x minikube
    sudo mv minikube /usr/local/bin/
    echo "Minikube installed successfully!"
else
    echo "Minikube is already installed."
fi

printf "\n\n\n"
printf "Starting a${GREEN} Clean Minikube${NC}!\n"
printf "\n\n\n"

# Starting minikube with basic resources.
minikube start --driver=kvm2 --memory 2048 --cpus 2
read -t 5 -p "Pausing for 5-seconds before continuing"
printf "\n\n\n"
printf "Successfully ${GREEN}Started a Clean Minikube${NC}!"
printf "\n\n\n"

read -t 5 -p "Pausing for 5-seconds before continuing to the third script"

# Proceed to the third script
if [ -f "$third_script" ]; then
  bash "$third_script"
else
  echo "The $third_script Does not exist"
fi

exit 1
