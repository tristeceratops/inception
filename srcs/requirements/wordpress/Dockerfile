FROM debian:bullseye

RUN apt update
RUN apt-get update
RUN apt-get -y install wget
RUN apt-get install -y php7.4 php-fpm php-mysql mariadb-client
RUN apt install inetutils-ping -y
RUN apt-get install telnet -y

#RUN wget https://wordpress.org/latest.tar.gz -P /var/www
#RUN cd /var/www && tar -xzf latest.tar.gz && rm latest.tar.gz

RUN mkdir var/www/wordpress -p
RUN chown -R root:root /var/www/wordpress
RUN chown -R www-data:www-data /var/www/wordpress

COPY conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

#EXPOSE 8080

RUN mkdir -p /run/php
COPY auto_config.sh /conf/auto_config.sh
RUN chmod +x /conf/auto_config.sh
#USER www-data
WORKDIR /var/www/html/wordpress
ENTRYPOINT ["sh", "/conf/auto_config.sh"]
#CMD ["exec", "/usr/sbin/php-fpm7.4", "-F"]
