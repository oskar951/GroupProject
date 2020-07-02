#!/bin/bash
sudo apt update -y
sudo apt install python3 python3-pip -y
pip3 install --user ansible
ansible --version
ansible-playbook -v -i inventory.cfg playbook.yml

