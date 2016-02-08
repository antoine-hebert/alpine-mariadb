#!/usr/bin/env bash
docker rm -f db
docker run -d -v /mysql:/mysql -p 3306:3306 --name db antoinehebert/alpine-mariadb
