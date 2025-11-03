FROM debian:12

RUN apt-get -y update && apt-get -y install nginx

COPY content/index.html /var/www/html/index.nginx-debian.html

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]