sudo apt install mysql-client -y
. ~/.bashrc
mysql --host=$dburl --user=$dbuser --password=$dbpass < /var/lib/jenkins/workspace/Group/spring-petclinic-rest/src/main/resources/db/mysql/initDB.sql
mysql --host=$dburl --user=$dbuser --password=$dbpass "petclinic" < /var/lib/jenkins/workspace/Group/spring-petclinic-rest/src/main/resources/db/mysql/populateDB.sql