FROM philipealmeida/opensuse-php

MAINTAINER Philipe Allan Almeida <philipeph3@gmail.com>

#Configuração do Vhost no apache
ADD ./config/redesuas.conf /etc/apache2/vhosts.d/redesuas.conf

RUN echo "xdebug.remote_enable = 1" >> etc/php7/apache2/php.ini
RUN echo "xdebug.remote_autostart = 1" >> etc/php7/apache2/php.ini
RUN echo "xdebug.remote_handler=dbgp" >> etc/php7/apache2/php.ini
RUN echo "xdebug.remote_mode=req" >> etc/php7/apache2/php.ini
RUN echo "xdebug.remote_port=10000" >> etc/php7/apache2/php.ini
RUN echo "xdebug.remote_log=/var/log/xdebug_remote.log" >> etc/php7/apache2/php.ini
RUN echo "xdebug.idekey=PHPSTORM" >> etc/php7/apache2/php.ini
RUN echo "xdebug.remote_connect_back=Off" >> etc/php7/apache2/php.ini

#Restarta o apache
RUN /usr/sbin/apachectl restart

VOLUME "/srv/www/htdocs"

EXPOSE 80

CMD /usr/sbin/apache2ctl -D FOREGROUND
