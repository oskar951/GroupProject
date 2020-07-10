sudo apt install mysql-client -y
. ~/.bashrc
mysql --host=$DBURL --user=$DBUSER --password=$DBPASS < ./spring-petclinic-rest/src/main/resources/db/mysql/initDB.sql
mysql --host=$DBURL --user=$DBUSER --password=$DBPASS "petclinic" < ./spring-petclinic-rest/src/main/resources/db/mysql/populateDB.sql