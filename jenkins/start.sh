#!/bin/sh
DEVOPS_HOME=/Volumes/dist/mac-local-devops
JENKINS_PATH=$DEVOPS_HOME/jenkins
docker run -d \
--name jenkins \
--restart always \
-p 8180:8080 -p 8185:50000 \
-v /usr/share/zoneinfo/Asia/Shanghai:/etc/localtime \
-v $DEVOPS_HOME/etc/timezone:/etc/timezone \
-v $JENKINS_PATH/data:/var/jenkins_home \
-v /var/run/docker.sock:/var/run/docker.sock \
jenkins/jenkins:2.378-alpine