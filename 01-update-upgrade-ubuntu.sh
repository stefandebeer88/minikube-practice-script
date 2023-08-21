#!/bin/bash

# STEP 01: Update & Upgrade System

# echo on (below command)
set -x
GREEN="\033[0;32m" # Green
NC="\033[0m" # No Color
second_script="./02-minikube-install-and-run.sh"
printf "\n\n"
printf "${GREEN}APT Update${NC}!\n"
printf "\n\n"
sudo apt update -yy
printf "\n\n"
printf "${GREEN}APT Full-Upgrade${NC}!\n"
printf "\n\n"
sudo apt full-upgrade -yy
printf "\n\n"
printf "${GREEN}PKCON Update${NC}!\n"
printf "\n\n"
sudo pkcon update -yy
printf "\n\n"
read -t 5 -p "Pausing for 5-seconds before continuing the Autoremove & Autoclean!"
printf "\n\n"
sudo apt autoremove -y && sudo apt autoclean -yy
printf "\n\n"
printf "Successfully ${GREEN}Updated & Upgraded ${NC}System!\n"
printf "\n\n"
# Run the second script
read -t 5 -p "Pausing for 5-seconds before going to the second script"
printf "\n"
if [ -f "$second_script" ]; then
  bash "$second_script"
else
  echo "The $second_script Does not exist"
fi
exit  1
