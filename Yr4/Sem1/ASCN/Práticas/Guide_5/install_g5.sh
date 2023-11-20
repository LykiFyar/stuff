# !/bin/bash
#set-e

function install_docker (){
    echo  "[TASK 1] Install Docker"
    echo  "[TASK 1.1] Remove old versions"
    sudo apt-get remove -y docker docker-engine docker.io containerd runc

    echo  "[TASK 1.2] Update"
    sudo apt-get -y update

    echo  "[TASK 1.3] Install packages"
    sudo apt-get -y install \
        ca-certificates \
        curl \
        gnupg \
        lsb-release

    echo  "[TASK 1.4] Add Docker's official GPG key"
    sudo mkdir -p /etc/apt/keyrings
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

    echo  "[TASK 1.5] Set up the stable repository"
    echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

    echo  "[TASK 1.6] Update"
    sudo apt-get -y update

    echo  "[TASK 1.7] Install Docker"
    sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin

    echo  "[TASK 1.8] Create docker group"
    sudo groupadd docker

    echo  "[TASK 1.9] Add user to docker group"
    sudo usermod -aG docker $USER

    echo  "[TASK 1.10] Enable new user"
    newgrp docker
    }

function  install_swap (){
    echo  "[TASK 2] Deploy MySQL and Swap"

    echo  "[TASK 2.1] Create network"
    docker network create swap_net

    echo  "[TASK 2.1] Deploy MySQL"
    docker image pull mysql:latest

    echo "[TASK 2.2] MySQL container run"
    docker run --name swapdb --net swap_net -p 3306:3306 -e  MYSQL_USER=swapuser -e MYSQL_PASSWORD="secret" -e MYSQL_DATABASE=swap -e MYSQL_ALLOW_EMPTY_PASSWORD=true -d mysql:latest

    echo "[TASK 2.3] Wait for MySQL to start"
    sleep 60

    echo  "[TASK 2.4] Deploy Swap"
    docker image pull ascnuminho/swap

    echo "[TASK 2.5] Swap container run"
    docker run  --name swapapp  --net swap_net -p 80:8000 -e DB_HOST=swapdb -e DB_DATABASE=swap -e DB_USERNAME=swapuser -e DB_PASSWORD="secret"  -e MIGRATE=true -d ascnuminho/swap

    echo  "[TASK 3] Check status"
    docker ps -a

    echo  "[TASK 4] Check logs"
    docker logs swapapp
    }

function  stop_swap (){
    echo  "[TASK 5] Stop containers"
    docker stop swapapp
    docker stop swapdb

    echo  "[TASK 6] Remove containers"
    docker rm swapapp
    docker rm swapdb
    }

"$@"

