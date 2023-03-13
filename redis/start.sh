#!/bin/sh
DEVOPS_HOME=$(cd "$(dirname "$0")";dirname "$PWD")
REDIS_PATH=$DEVOPS_HOME/redis
docker run -d \
--name redis \
--restart always \
-p 6379:6379 \
-v /usr/share/zoneinfo/Asia/Shanghai:/etc/localtime \
-v $DEVOPS_HOME/etc/timezone:/etc/timezone \
-v $REDIS_PATH/data:/data \
-v $REDIS_PATH/conf/redis.conf:/etc/redis/redis.conf \
redis:6.2.11-alpine \
redis-server /etc/redis/redis.conf --appendonly yes