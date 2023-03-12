#!/bin/sh
DEVOPS_HOME=/Volumes/dist/mac-local-devops
JAEGER_PATH=$DEVOPS_HOME/jaeger
docker run -d \
--name jaeger-all-in-one \
--restart always \
-p 5775:5775/udp -p 16686:16686 -p 14250:14250 -p 14268:14268 \
jaegertracing/all-in-one:latest