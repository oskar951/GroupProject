#!/bin/bash
#docker rmi $(docker images -aq) -f #delete all images

#docker-compose build

#docker push hsjhita1/backend:latest

#docker push hsjhita1/frontend:latest
. ~/.bashrc
printenv
sudo docker-compose up -d #remove and replace with kubernetes commands
