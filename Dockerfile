FROM philipealmeida/opensuse-php

MAINTAINER Philipe Allan Almeida <philipeph3@gmail.com>

RUN echo export 172.17.0.2      desenvolvimento.mds.net >> /etc/hosts

ADD ./config/redesuas.conf /etc/apache2/vhosts.d/redesuas.conf

RUN /usr/sbin/apachectl restart

VOLUME "/srv/www/htdocs"

EXPOSE 80

CMD /usr/sbin/apache2ctl -D FOREGROUND