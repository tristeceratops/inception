FROM debian:bullseye
RUN apt update -y
RUN apt-get install mariadb-server -y
COPY conf/mariadb.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
ADD db.sh /
#RUN ./db.sh
