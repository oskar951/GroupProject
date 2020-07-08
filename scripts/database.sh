sudo apt install mysql-client -y
. ~/.bashrc
mysql --host=$DBURL --user=$DBUSER --password=$DBPASS < /var/lib/jenkins/workspace/Group/spring-petclinic-rest/src/main/resources/db/mysql/initDB.sql
mysql --host=$DBURL --user=$DBUSER --password=$DBPASS "petclinic" < /var/lib/jenkins/workspace/Group/spring-petclinic-rest/src/main/resources/db/mysql/populateDB.sql