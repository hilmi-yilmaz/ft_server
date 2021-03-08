# ft_server
A LEMP stack inside of one Docker container.

The LEMP stack is a group of software that can be used to serve dynamic webpages.

Dynamic webpages display different content each time it is viewed. It can change
while displaying the time, or it changes because of different users logging in.

LEMP stands for Linux Nginx Mysql PHP. Linux is the Operating System, Nginx is the webserver, Mysql is the database and the dynamic processing is handled by PHP.

apt update --> Update the local packege index. It downloads the packages list from the repositories and "updates" them to get information on the newest versions of packages and their dependencies.

# Packages

php-mbstring:
An extension of PHP used to manage non-ASCII strings. It provides multibyte specific string functions that help you deal with multiobyte encodings. 

nginx:
The webserver


mariadb-server:
The database to store website information.

php-fpm:
Nginx requires an external program to handle PHP processing: php-fpm. We tell Nginx to pass PHP requests to this software for processing.

php-mysql:
A php module that allows PHP to communicate with MySQL-based databases.

wget:
A utility for non-interactive downloads of files from the web.

curl:
Same as wget for our usage.

# Downloads

phpmyadmin:
A software tool written in PHP to handle the administration of MySQL over the Web.

# SSL
SSL stands for Secure Sockets Layer and it is a technology for keeping an internet connection secure and safeguarding any sensitive data that is being sent between two systems, preventing criminals from reading and modifying any information transferred. 

It does this by making sure that any data transfered between user and sites are impossible to read. It uses encrypting algorithms to scramble data in transit. 

https://www.akadia.com/services/ssh_test_certificate.html
