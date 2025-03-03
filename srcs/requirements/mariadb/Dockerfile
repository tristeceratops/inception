FROM debian:bullseye
RUN apt update -y
RUN apt-get install mariadb-server -y
COPY conf/mariadb.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY db.sh /conf/db.sh
#EXPOSE 3306
ENTRYPOINT ["sh", "/conf/db.sh"]
