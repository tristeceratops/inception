FROM debian:bullseye
RUN apt update
RUN apt install nginx -y
RUN apt install curl -y
RUN apt install inetutils-ping -y
RUN apt-get install telnet -y
RUN mkdir -p /etc/nginx/ssl
RUN apt install openssl -y
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=LU/ST=LU/L=Belval/O=42/OU=42/CN=ewoillar.42.fr/UID=ewoillar"
RUN mkdir -p /var/run/nginx
COPY conf/nginx.conf /etc/nginx/nginx.conf
RUN mkdir -p /var/www/html
RUN chmod 755 /var/www/html
RUN chown -R www-data:www-data /var/www/html
RUN mv /var/www/html/index.nginx-debian.html /var/www/html/index.html
RUN ln -sf /dev/stdout /var/log/nginx/access.log && ln -sf /dev/stderr /var/log/nginx/error.log
CMD [ "nginx", "-g", "daemon off;" ]
#EXPOSE 443
