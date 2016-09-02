FROM ubuntu

# install curl and php
RUN apt-get update
RUN apt-get install -y curl php7.0 php7.0-cli php7.0-zip

# install composer
RUN curl -sS https://getcomposer.org/installer | php && mv composer.phar /usr/bin/composer

# install silex
RUN mkdir -p /var/www/silex && cd /var/www/silex && composer require silex/silex:~2.0

ENV WORKDIR /var/www/silex

# add application source file
ADD index.php ${WORKDIR}

# run PHP server
CMD php -S 0.0.0.0:8080 -t ${WORKDIR}
