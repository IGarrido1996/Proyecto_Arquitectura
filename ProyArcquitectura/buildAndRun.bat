@echo off
call mvn clean package
call docker build -t com.mycompany/ProyArcquitectura .
call docker rm -f ProyArcquitectura
call docker run -d -p 9080:9080 -p 9443:9443 --name ProyArcquitectura com.mycompany/ProyArcquitectura