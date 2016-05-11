FROM ubuntu

# install curl and php
RUN apt-get update && apt-get install -y curl zip php php-cli

# install composer
RUN curl -sS https://getcomposer.org/installer | php && mv composer.phar /usr/bin/composer
RUN chmod +x /usr/bin/composer

# user
RUN useradd -ms /bin/bash silex
USER silex
WORKDIR /home/silex

# install silex
RUN composer require silex/silex

# add application source file
ADD index.php /home/silex

# run PHP server
CMD php -S 0.0.0.0:80 -t /home/silex
