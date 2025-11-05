#!/bin/bash

mysqld_safe --datadir=/var/lib/mysql &

until mariadb -e "SELECT 1" >/dev/null 2>&1; do
    sleep 1
done

mariadb <<EOF
CREATE DATABASE IF NOT EXISTS Wordpress;
USE Wordpress;
CREATE TABLE IF NOT EXISTS Users (
    userid INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(255),
    role VARCHAR(255)
);
INSERT INTO Users (username, role) VALUES ("user1", "admin"), ("user2", "user");
EOF

service mariadb stop

exec /usr/bin/mariadbd-safe



