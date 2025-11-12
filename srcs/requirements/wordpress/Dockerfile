FROM debian:12

RUN apt-get -y update && apt-get -y install wget
RUN apt install php8.2-fpm -y
RUN apt install php8.2-mysql -y

RUN wget "https://wordpress.org/latest.tar.gz" && \
tar -xzf latest.tar.gz  && rm latest.tar.gz

COPY tools/setup.sh	.

ENTRYPOINT ["sh", "setup.sh"]
