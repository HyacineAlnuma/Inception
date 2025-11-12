#!/bin/bash

mysqld_safe --datadir=/var/lib/mysql &

until mariadb -e "SELECT 1" >/dev/null 2>&1; do
    sleep 1
done

mariadb <<EOF
CREATE DATABASE IF NOT EXISTS $DB_NAME;
USE $DB_NAME;
CREATE TABLE IF NOT EXISTS Users (
    userid INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(255),
    role VARCHAR(255)
);
INSERT INTO Users (username, role) VALUES ("user1", "admin"), ("user2", "user");
CREATE USER '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD';
GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%';
FLUSH PRIVILEGES;
EOF
sed -i "s/\(bind-address\s*= \).*/\1 0.0.0.0/" /etc/mysql/mariadb.conf.d/50-server.cnf
service mariadb stop

exec /usr/bin/mariadbd-safe



