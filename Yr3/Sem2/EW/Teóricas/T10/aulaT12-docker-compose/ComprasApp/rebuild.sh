#!/bin/bash
docker-compose down
docker rmi comprasapp_auth_server
docker rmi comprasapp_data_server
docker rmi comprasapp_app
docker-compose up -d --build