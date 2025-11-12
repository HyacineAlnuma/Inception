FROM debian:12

RUN apt-get -y update && apt-get -y install mariadb-server

COPY ./tools/setup.sh /

RUN chmod +x /setup.sh

ENTRYPOINT ["/setup.sh"]
