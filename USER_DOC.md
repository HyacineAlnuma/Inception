# User Documentation - Inception

This documentation provides a guide for users and administrators to operate the Inception web stack.

## 1. Services Provided
The project deploys a complete and secure WordPress environment consisting of:
* NGINX: The web server and entry point, configured with TLS for secure connections.
* WordPress: The website engine, pre-configured and running on PHP-FPM.
* MariaDB: The database engine that stores all posts, users, and site configuration.

## 2. Managing the project
All operations are centralized through the Makefile at the root of the repository:

* `make` to start the project.
* `make stop` to stop the project.
* `make clean` to clean everything except volumes (containers, images, and networks).

## 3. Accessing the Website
Once the containers are running, you can access the site via your browser:
* Public Website: https://halnuma.42.fr
* Administration Panel: https://halnuma.42.fr/wp-admin

Note: Since we use self-signed certificates for this academic project, your browser will show a warning. Click Advanced and Proceed to access the site.

## 4. Credentials
All sensitive information, including administrator and user logins, is managed via the .env file located at the project root. This file contains:
* Database root and user passwords.
* WordPress admin and standard user credentials.

## 5. Checking Service Status

* `make status` to show status of all services.