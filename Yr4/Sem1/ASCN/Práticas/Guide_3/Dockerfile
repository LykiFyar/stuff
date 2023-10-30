# Linux version running on container
FROM ubuntu:20.04

# Install common utilities
RUN apt update && apt-get install -y software-properties-common

# Add php repo
RUN add-apt-repository ppa:ondrej/php && apt update

# Install php
RUN apt-get install -y php7.4 php7.4-fpm php7.4-zip php7.4-mbstring php7.4-tokenizer php7.4-mysql php7.4-gd php7.4-xml php7.4-bcmath php7.4-intl php7.4-curl

# Install nodejs, composer and npm
RUN apt install -y nodejs 
RUN apt install -y composer 
RUN apt install -y npm

# Install git if not installed
RUN apt-get update && apt-get install -y git

# Clone swap repo
RUN git clone https://github.com/Hackathonners/swap

# Move to /swap
WORKDIR /swap

# Install composer packages
RUN composer install

# Install swap
RUN npm install

# Change environmental variables
COPY env_example .env

# Generate app's key
RUN php artisan key:generate


# seed the database - TODO
# CMD php artisan db:seed

# Start SWAP
EXPOSE 8000
CMD php artisan migrate && php artisan serve --host=0.0.0.0
