#!/bin/bash
#docker rmi $(docker images -aq) -f #delete all images

#docker-compose build

#docker push hsjhita1/backend:latest

#docker push hsjhita1/frontend:latest
. ~/.bashrc
printenv
env DBURL=${DBURL}
env DBUSER=${DBUSER}
env DBPASS=${DBPASS}
#sudo docker-compose up -d #remove and replace with kubernetes commands


sudo env DBURL=${DBURL} DBUSER=${DBUSER} DBPASS=${DBPASS} docker stack deploy -c docker-compose.yaml group
