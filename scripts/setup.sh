#!/bin/bash
sudo apt update -y
sudo apt install python3 python3-pip -y
sudo apt install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
sudo apt update -y
sudo apt install docker-ce -y
sudo apt install docker-compose -y
sudo systemctl start docker
#pip3 install --user ansible
#ansible --version
#ansible-playbook -v -i inventory.cfg playbook.yml

