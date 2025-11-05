FROM debian:12

RUN apt-get -y update && apt-get -y install nginx

RUN apt install -y openssl && mkdir -p /etc/ssl/private /etc/ssl/certs && \
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx_ssl.key \
-out /etc/ssl/certs/nginx_ssl.crt -subj "/C=FR/ST=RHONE/L=Lyon/O=42/OU=Student/CN=halnuma.42.fr"

RUN apt remove -y openssl

COPY conf/nginx.conf etc/nginx/nginx.conf

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]