#!/bin/sh
#export SQL_DATABASE="website"
#export SQL_USER="ewoillar"
#export SQL_PASSWORD="1234"
#export SQL_ROOT_PASSWORD="r1234"
#export ADMIN_USER="ewoillar"
#export ADMIN_PASSWORD="adm1234"
#export ADMIN_EMAIL="ewoillar@student.42luxembourg.lu"
#export USER_LOGIN="pibernar"
#export USER_EMAIL="test@student.42luxembourg.lu"

#echo "SQL_ROOT_PASSWORD: $SQL_ROOT_PASSWORD"

service mariadb start;
mariadb -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;"
mariadb -e "CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'localhost' IDENTIFIED BY '${SQL_PASSWORD}';"
mariadb -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';" -u root
mariadb -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"
mariadb -e "FLUSH PRIVILEGES;" -u root --password=$SQL_ROOT_PASSWORD
mariadb-admin -u root -p$SQL_ROOT_PASSWORD shutdown
exec mariadbd-safe
