#!/bin/sh
DEVOPS_HOME=$(cd "$(dirname "$0")";dirname "$PWD")
ZINC_PATH=$DEVOPS_HOME/zincsearch
docker run -d \
--name zincsearch \
--restart always \
-p 4080:4080 \
-v /usr/share/zoneinfo/Asia/Shanghai:/etc/localtime \
-v $DEVOPS_HOME/etc/timezone:/etc/timezone \
-v $ZINC_PATH/data:/data \
-e ZINC_DATA_PATH="/data" \
-e ZINC_FIRST_ADMIN_USER=admin -e ZINC_FIRST_ADMIN_PASSWORD=123456 \
public.ecr.aws/zinclabs/zinc:0.4.2