#!/bin/bash
#docker rmi $(docker images -aq) -f #delete all images
#docker-compose build
sudo docker build -t hsjhita1/backend:latest ./spring-petclinic-rest/
sudo docker build -t hsjhita1/frontend:latest ./spring-petclinic-angular/
sudo docker push hsjhita1/backend:latest
sudo docker push hsjhita1/frontend:latest
. ~/.bashrc
printenv
env DBURL=${DBURL}
env DBUSER=${DBUSER}
env DBPASS=${DBPASS}
#sudo docker-compose up -d #remove and replace with kubernetes commands


sudo env dburl=${DBURL} dbuser=${DBUSER} dbpass=${DBPASS} docker stack deploy -c docker-compose.yaml group
