#!/bin/sh
mvn clean package && docker build -t com.mycompany/ProyArcquitectura .
docker rm -f ProyArcquitectura || true && docker run -d -p 9080:9080 -p 9443:9443 --name ProyArcquitectura com.mycompany/ProyArcquitectura