#!/bin/bash

IMAGE_NAME="recursive/developer"
SERVER_CONTAINER_NAME="express"
BD_CONTAINER_NAME="mysql"
BD_VOLUME_NAME="mysql-volume"
NET_NAME="express_net"

docker rm -f express mysql
docker network rm $NET_NAME

#docker network create -d bridge $NET_NAME
docker volume create $BD_VOLUME_NAME
docker run --name $BD_CONTAINER_NAME --net=bridge -p3306:3306 -v $BD_VOLUME_NAME:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=secret -d mysql:latest

cd ./Server
docker build -f ../Docker/dockerfile -t $IMAGE_NAME:v0.1 . && \
docker run --name $SERVER_CONTAINER_NAME --net=bridge -p3000:3000 -d $IMAGE_NAME:v0.1
