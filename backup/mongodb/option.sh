#!/usr/bin/env bash

function backup_mongodb() {
    echo "start to dump mongodb!"
    now=`date +%Y-%m-%d`
    mongodump \
        -h 39.106.34.109:3040 \
        -u mongodb \
        -p mongodb2333 \
        -d icecory \
        --authenticationDatabase admin \
        -o db-dump-${now}

    if [ $? -ne 0 ]; then
        echo "failed to dump mongodb!"
    else
        echo "success to dump mongodb!"
    fi
}
