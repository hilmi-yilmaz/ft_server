# Base image is debian 10 (buster)
FROM debian:buster

#Install necessary packages non-interactively
RUN DEBIAN_FRONTEND=noninteractive \
    apt-get -y update && \
    apt-get -y install  nginx \
                        php-fpm \
                        php-mysql \
                        mariadb-server \
                        php-mbstring \
                        wget \
                        curl \
                        openssl

# Create the root directory of the website and delete default configuration
RUN     mkdir /var/www/website && \
        rm -f /etc/nginx/sites-enabled/default


# Install phpMyAdmin
WORKDIR /var/www/website
RUN     wget https://files.phpmyadmin.net/phpMyAdmin/5.0.4/phpMyAdmin-5.0.4-all-languages.tar.gz && \
        tar -xvzf phpMyAdmin-5.0.4-all-languages.tar.gz && \
        rm -rdf phpMyAdmin-5.0.4-all-languages.tar.gz && \
        mv phpMyAdmin-5.0.4-all-languages phpmyadmin

# Create a user and database for Wordpress to use
COPY    srcs/mysql_setup.sql /bin/
RUN     service mysql start && \ 
        mysql < /bin/mysql_setup.sql

# Install the Wordpress using wordpress Command-Line client
WORKDIR /
RUN     service mysql start && \
        curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
        chmod +x wp-cli.phar && \
        mv wp-cli.phar /usr/local/bin/wp && \
        cd /var/www/website/ && \
        mkdir wordpress && \
        cd wordpress && \
        wp core download --allow-root && \
        wp config create --dbname=wordpress --dbuser=user --dbpass=password --dbhost=localhost --allow-root && \
        wp core install --url=localhost/wordpress/ --title=BoringWebsite --admin_user=user --admin_password=password --admin_email=info@example.com --allow-root

# Generate SSL key and certificate
RUN     openssl req -newkey rsa:2048 -nodes -keyout etc/ssl/private/nginx_ssl.key \
        -x509 -days 365 -out etc/ssl/certs/nginx_ssl.crt \
        -subj "/C=NL/ST=Utrech/L=Utrecht/O=Codam/CN=localhost"

#Copy necessary files into the container
COPY    srcs/nginx.conf /etc/nginx/conf.d
COPY    srcs/config.inc.php /var/www/website/phpmyadmin/
COPY    srcs/autoindex_switch.sh /bin/
COPY    srcs/start_services.sh /bin/
COPY    srcs/index.html /var/www/website

# Change the ownership and permissions for the files to be served by the web server
RUN     chown -R www-data:www-data /var/www/website && \
        chmod -R 755 /var/www/website

# Expose ports for http and https
EXPOSE  80 443

# Run the container with the following main process
CMD     ["/bin/bash", "/bin/start_services.sh"]