# Docker SWAP DB

```sh
docker image pull mysql:latest

docker run --name swapDB --net ASCNswapTP5 -p 3306:3306 -d -e MYSQL_USER=teste -e MYSQL_PASSWORD=123456 -e MYSQL_DATABASE=swap -e MYSQL_ALLOW_EMPTY_PASSWORD=true mysql:latest

docker logs swapDB

docker exec -ti swapDB /bin/sh

mysql

show databases
```
# Docker SWAP APP
```sh
docker build . -t swap_image

docker run --net ASCNswapTP5 -p 8000:8000 --name swap_app swap_image```