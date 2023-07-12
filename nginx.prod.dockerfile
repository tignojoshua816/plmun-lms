FROM nginx:stable-alpine

ENV NGINXUSER=laravel
ENV NGINXGROUP=laravel

RUN mkdir -p /var/www/html/public

ADD nginx/default.prod.conf /etc/nginx/conf.d/default.prod.conf
ADD nginx/cert.pem /etc/nginx/certs/cert.pem
ADD nginx/key.pem /etc/nginx/certs/key.pem


RUN sed -i "s/user www-data/user ${NGINXUSER}/g" /etc/nginx/nginx.conf

RUN adduser -g ${NGINXGROUP} -s /bin/sh -D ${NGINXUSER}