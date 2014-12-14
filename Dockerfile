FROM ubuntu

# install curl and php
RUN apt-get install -y curl php5 php5-cli

# install composer
RUN curl -sS https://getcomposer.org/installer | php && mv composer.phar /usr/bin/composer

# install silex
RUN mkdir /var/www/silex && cd /var/www/silex && composer require silex/silex:~1.2

# add application source file
ADD index.php /var/www/silex/

# run PHP server
CMD php -S 0.0.0.0:80 -t /var/www/silex
