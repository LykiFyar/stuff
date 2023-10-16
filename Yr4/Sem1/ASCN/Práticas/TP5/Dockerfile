FROM ubuntu:20.04
RUN apt update && apt-get install -y software-properties-common
RUN add-apt-repository ppa:ondrej/php
RUN apt update
RUN apt install php7.4 php7.4-{fpm,zIP,mbstring,tokenizer,mysql,gd,xml,bcmath,intl,curl}
RUN apt install nodejs
RUN apt install composer
RUN apt install npm
RUN git clone https://github.com/Hackathonners/swap
WORKDIR /swap
RUN composer install
RUN npm install
ENV DB_HOST=172.18.0.2
ENV DB_DATABASE=swap
ENV DB_USERNAME=vagrant
ENV DB_PASSWORD=123456
RUN php artisan key:generate
RUN php artisan migrate
RUN php artisan db:seed
CMD [ "php", "artisan", "serve", "--host=0.0.0.0" ]
EXPOSE 3000