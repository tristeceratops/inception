FROM debian:buster
RUN apt update
RUN apt-get update
RUN apt-get -y install wget
RUN apt-get install -y php php-fpm php-mysql mariadb-client
RUN wget https://wordpress.org/latest.tar.gz -P /var/www
RUN cd /var/www && tar -xzf latest.tar.gz && rm latest.tar.gz
RUN chown -R root:root /var/www/wordpress
COPY conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp
#EXPOSE 8080
COPY auto_config.sh /conf/auto_config.sh
#USER www-data
#ENTRYPOINT ["sh", "/conf/auto_config.sh"]
RUN mkdir -p /run/php
RUN cd /usr/bin
RUN php-fpm7.3 -F
