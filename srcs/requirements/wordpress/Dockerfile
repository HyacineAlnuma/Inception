FROM debian:12

RUN apt -y update && apt -y install \
    wget \
    php8.2-fpm \
    php8.2-mysql \
    php8.2-cli \
	libfcgi-bin \
	default-mysql-client

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp

WORKDIR /var/www/html/wordpress

COPY ./tools/setup.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/setup.sh

ENTRYPOINT ["setup.sh"]