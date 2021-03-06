/*  This sql script creates a database called "wordpress".
    It the creates a user called "user" with password "password".
    Privileges on all databases and tables are assigned to this user. */
    
CREATE DATABASE wordpress DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
CREATE USER 'user'@'localhost' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON *.* TO 'user'@'localhost';
FLUSH PRIVILEGES;
