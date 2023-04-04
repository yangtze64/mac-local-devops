#!/bin/sh
DEVOPS_HOME=$(cd "$(dirname "$0")";dirname "$PWD")
MEILI_PATH=$DEVOPS_HOME/meilisearch
docker run -d \
--name meilisearch \
--restart always \
-p 7700:7700 \
-v /usr/share/zoneinfo/Asia/Shanghai:/etc/localtime \
-v $DEVOPS_HOME/etc/timezone:/etc/timezone \
-v $MEILI_PATH/data:/meili_data \
-e MEILI_ENV='development' \
getmeili/meilisearch:v1.1