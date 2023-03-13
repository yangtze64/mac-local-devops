#!/bin/sh
DEVOPS_HOME=$(cd "$(dirname "$0")";dirname "$PWD")
MYSQL_PATH=$DEVOPS_HOME/mysql
docker run -d \
--name mysql \
--restart always \
-p 3307:3306 \
-v /usr/share/zoneinfo/Asia/Shanghai:/etc/localtime \
-v $DEVOPS_HOME/etc/timezone:/etc/timezone \
-v $MYSQL_PATH/conf:/etc/mysql/conf.d \
-v $MYSQL_PATH/data:/var/lib/mysql \
-v $MYSQL_PATH/logs:/logs \
-e MYSQL_ROOT_PASSWORD=123456 \
mysql:5.7.41