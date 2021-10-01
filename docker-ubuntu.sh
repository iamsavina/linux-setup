#!/bin/bash

error_handler() {
  echo "******* FAILED *******" 1>&2
  exit 1
}

trap error_handler ERR

sudo apt-get remove docker docker-engine docker.io containerd runc
echo 'old versions successfully uninstalled (if existed)'

sudo apt-get -y update
echo 'updating succeed'

sudo apt-get -y install apt-transport-https ca-certificates curl gnupg lsb-release
echo 'dependencies installed'

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo 'official gpg key added'

echo \
  "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
echo 'set up the stable repository succeed'

sudo apt-get update
echo 'updating succeed'

sudo apt-get install docker-ce docker-ce-cli containerd.io
echo 'docker engine succeed'

sudo docker run hello-world
echo 'docker hello-world image successfully tested'
