#!/bin/bash

mariadb << eof
CREATE DATABASE Wordpress;
USE Wordpress;
CREATE TABLE Users (userid int NOT NULL PRIMARY KEY AUTO_INCREMENT, username varchar(255), role varchar(255));
INSERT INTO Users (username, role) VALUES ("user1", "admin");
INSERT INTO Users (username, role) VALUES ("user2", "user");
eof

