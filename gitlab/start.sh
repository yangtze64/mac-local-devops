#!/bin/sh
DEVOPS_HOME=$(cd "$(dirname "$0")";dirname "$PWD")
GITLAB_HOME=$DEVOPS_HOME/gitlab
docker run -d \
--hostname gitlab.devops.me \
--name gitlab \
--restart always \
-p 8183:443 -p 8181:8181 -p 8182:22 \
-v /usr/share/zoneinfo/Asia/Shanghai:/etc/localtime \
-v $DEVOPS_HOME/etc/timezone:/etc/timezone \
-v $GITLAB_HOME/config:/etc/gitlab \
-v $GITLAB_HOME/logs:/var/log/gitlab \
-v $GITLAB_HOME/data:/var/opt/gitlab \
gitlab/gitlab-ce:15.6.4-ce.0