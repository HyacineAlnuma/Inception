FROM debian:12

RUN apt -y update && apt -y install mariadb-server

COPY /tools/setup.sh /

RUN chmod +x /setup.sh

ENTRYPOINT ["sh", "/setup.sh"]
