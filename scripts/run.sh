. ~/.bashrc
printenv
env DBURL=${DBURL}
env DBUSER=${DBUSER}
env DBPASS=${DBPASS}
#sudo docker-compose up -d #remove and replace with kubernetes commands


sudo env dburl=${DBURL} dbuser=${DBUSER} dbpass=${DBPASS} docker stack deploy -c docker-compose.yaml group
