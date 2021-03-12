# ft_server

This project is about setting up a LEMP stack inside one Docker container. LEMP stands for **L**inux **N**ginx **M**ySQL **P**HP. The LEMP stack is a group of software which can be used to serve dynamic webpages.

## Description

The LEMP stack is used to serve a Wordpress website. Nginx redirects all HTTP traffic to HTTPS. A self-signed SSL certificate is generated with OpenSSL. Also there is an autoindex switcher which can be used to turn on/off the autoindex directive of Nginx.

## Installation

Clone this repository and go inside of it:

```sh
git clone https://github.com/hilmi-yilmaz/ft_server.git lemp
cd lemp
```

### Requirements

- Docker Engine Software (to run Docker containers)

## Usage
To build and start the container run the following command:

```sh
./run.sh
```

This runs the container and maps port 80 and 443 of the container to port 80 and 443 respectively on the Docker Host. The container runs in detached mode. The name of the container is _web_server_.

The website is setup and you can go to _http://localhost_. Your web browser will show you a warning about the security of this website because the SSL certificate is self-signed and not signed by a Certificate Autority (CA). You can ignore this and proceed to the website. You will see a simple HTML page to navigate to the Wordpress website or PhpMyAdmin to handle administration of MySQL over the web. 

### Switch autoindex

To switch the autoindex on/off you can run:

```sh
./run_switch.sh [on|off]
```

## License
[MIT](https://opensource.org/licenses/MIT)