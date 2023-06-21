FROM ubuntu:xenial



RUN apt-get update \
    && apt-get -q -y dist-upgrade \
    && DEBIAN_FRONTEND=noninteractive \
    apt-get -q -y install --no-install-recommends \
    apache2 \
    mariadb-server \
    php \
    libapache2-mod-php \
    php-mcrypt \
    php-mysql \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /var/www/html/*

# Clone the code from GitHub repository
RUN apt update && apt install -y git
RUN git clone https://github.com/prajeet1000/docker-lamp.git

# Copy the cloned folder to the Apache web root

RUN cp -r docker-lamp/* /var/www/html/

EXPOSE 80
EXPOSE 443
EXPOSE 3306

# Start Apache and MySQL services
CMD service apache2 start && service mysql start && tail -f /dev/null
