#!/bin/bash

set -e

dockerID=$(docker ps | grep couchbase-bak-deployment | awk '{print $1}' | head -n 1)
Date=`TZ=UTC-8 date +%Y%m%d%H%M`
docker exec -it ${dockerID} bash -c "cbbackup http://seal-ui.couchbase:8091 /bak/backup-${Date} -u admin -p curacloud"
