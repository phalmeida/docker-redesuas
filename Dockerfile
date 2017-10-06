FROM philipealmeida/opensuse-php

MAINTAINER Philipe Allan Almeida <philipeph3@gmail.com>

#Configuração do Host
RUN echo export 172.17.0.2      desenvolvimento.mds.net >> /etc/hosts

#Configuração do Vhost no apache
ADD ./config/redesuas.conf /etc/apache2/vhosts.d/redesuas.conf

#Restarta o apache
RUN /usr/sbin/apachectl restart

VOLUME "/srv/www/htdocs"

EXPOSE 80

CMD /usr/sbin/apache2ctl -D FOREGROUND
