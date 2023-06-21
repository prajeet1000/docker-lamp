FROM ubuntu:xenial



RUN apt-get update \
    && apt-get -q -y dist-upgrade \
    && DEBIAN_FRONTEND=noninteractive \
    apt-get -q -y install --no-install-recommends \
    lamp-server^ 
    

EXPOSE 80
EXPOSE 443
EXPOSE 3306

# Start Apache and MySQL services
CMD service apache2 start && service mysql start && tail -f /dev/null
