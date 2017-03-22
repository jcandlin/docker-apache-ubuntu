FROM ubuntu:xenial
MAINTAINER Jon Candlin jon.candlin@gmail.com


RUN apt-get update \
    && apt-get install -y --no-install-recommends \
	apache2 \
    && rm -r /var/lib/apt/lists/*

env APACHE_RUN_USER    www-data
env APACHE_RUN_GROUP   www-data
env APACHE_LOG_DIR     /var/log/apache
env APACHE_PID_FILE    /var/run/apache2.pid
env APACHE_LOCK_DIR    /var/lock/apache2
env APACHE_SERVERADMIN jon.candlin@gmail.com
env APACHE_DOCUMENTROOT /var/www/site/app


ADD app /var/www/site/app
ADD apache-config.conf /etc/apache2/sites-enabled/000-default.conf
#ADD index.html /var/www/html

EXPOSE 80

CMD /usr/sbin/apachectl -D FOREGROUND
