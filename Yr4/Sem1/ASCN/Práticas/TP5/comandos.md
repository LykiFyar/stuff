# Docker SWAP DB

docker image pull mysql:latest

docker run --name swapDB --net ASCNswapTP5 -p 3306:3306 -d -e MYSQL_USER=teste -e MYSQL_PASSWORD=123456 -e MYSQL_DATABASE=swap -e MYSQL_ALLOW_EMPTY_PASSWORD=true mysql:latest

docker logs swapDB

docker exec -ti swapDB /bin/sh

mysql

show databases

# Docker SWAP APP

