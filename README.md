*This project has been created as part of the 42 curriculum by halnuma.*

# Inception

## Description

Inception is 42 school project aiming to introduce Docker. The goal is to set up a complete infrastructure using several services, all running inside their own dedicated containers within a single virtual machine.

## Instructions

### Prerequisites

* Docker, Docker Compose amd Make must be installed.
* You must have sudo privileges.
* You must map your local IP to the domain name by adding this line to your /etc/hosts file: 127.0.0.1 halnuma.42.fr

All sensitive data (passwords, logins) must be defined in a .env file at the root of the project. Ensure the following variables are set:
* MariaDB: DB_HOST, DB_USER, DB_PASSWORD, DB_NAME
* WordPress: DOMAIN_NAME, SITE_TITLE, ADMIN_USER, ADMIN_PASSWORD, ADMIN_EMAIL, USER_LOGIN, USER_PASSWORD, USER_EMAIL

### Running the project

The entire process is automated via a Makefile at the root of the project:

* `make` to start the project.
* `make status` to show status of all services.
* `make stop` to stop the project.
* `make clean` to clean everything except volumes (containers, images, and networks).
* `make fclean` to clean everything (containers, images, volumes, and networks).

## Project Description

### 1. Virtual Machines vs Docker
While a VM includes a full Operating System and its own kernel (making it heavy and slow to boot), Docker shares the host machine's kernel. This makes containers much lighter and efficient. They quicker and use less RAM.

### 2. Secrets vs Environment Variables
I use a .env file to manage sensitive data like database passwords and admin logins.
* **Environment Variables:** Great for configuration but can be seen via docker inspect.
* **Secrets:** Secrets are encrypted data managed by Docker, which are mounted as temporary files in the container's RAM. For this project, .env is used for simplicity, but it is never pushed to the Git repository for security reasons.

### 3. Docker Network vs Host Network
I implemented a dedicated bridge network called inception.
* **Host Network:** The container shares the host's IP directly, which lacks isolation and security.
* **Docker Network (Bridge):** It provides an isolated environment where containers can talk to each other by name (DNS). MariaDB is hidden from the outside world, only NGINX is exposed via port 443.

### 4. Docker Volumes vs Bind Mounts
The project strictly uses Named Volumes for database and WordPress data.
* **Bind Mounts:** Direct links to a local folder on the host.
* **Named Volumes:** Docker manages the storage location and permissions. This ensures my data (SQL tables, WordPress posts) survives even if the containers are destroyed and recreated.

## Resources

**Docker:**
* https://docs.docker.com/get-started/introduction/
* https://www.ionos.fr/digitalguide/serveur/know-how/docker-vs-virtual-machines/
* https://blog.stephane-robert.info/docs/conteneurs/orchestrateurs/docker-compose/

**Nginx:**
* https://codingwithmanny.medium.com/configure-self-signed-ssl-for-nginx-docker-from-a-scratch-7c2bcd5478c6
* https://nginx.org/en/docs/

**Wordpress:**
* https://developer.wordpress.org/cli/commands/
* https://serversforhackers.com/c/php-fpm-configuration-the-listen-directive