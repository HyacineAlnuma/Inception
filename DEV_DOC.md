# Developer Documentation - Inception

This document is intended for developers who need to set up, maintain, or debug the Inception infrastructure.

## 1. Environment Setup

* Docker, Docker Compose amd Make must be installed.
* You must have sudo privileges.
* You must map your local IP to the domain name by adding this line to your /etc/hosts file: 127.0.0.1 halnuma.42.fr

All sensitive data (passwords, logins) must be defined in a .env file at the root of the project. Ensure the following variables are set:
* MariaDB: DB_HOST, DB_USER, DB_PASSWORD, DB_NAME
* WordPress: DOMAIN_NAME, SITE_TITLE, ADMIN_USER, ADMIN_PASSWORD, ADMIN_EMAIL, USER_LOGIN, USER_PASSWORD, USER_EMAIL

## 2. Build and Launch

The entire process is automated via a Makefile at the root of the project:

* `make` to start the project.
* `make stop` to stop the project.
* `make clean` to clean everything except volumes (containers, images, and networks).
* `make fclean` to clean everything (containers, images, volumes, and networks).
* `make re` to orces a full rebuild of the images and restarts the projet.

## 3. Container and volumes management

* `make status` to show status of all services.
* `make clean_vol` to clean all volumes.

## 4. Data Persistence & Storage

This project uses Docker volumes to ensure that the data isn't lost when containers are stopped or deleted.

* Database Storage: The mariadb_data volume is stored in `/var/lib/mysql` inside the MariaDB container and in `/home/halnuma/data/db` in the local machine.
* WordPress Files: The wordpress_data volume is stored in `/var/www/html` inside the WordPress container and in `/home/halnuma/data/wordpress` in the local machine.
