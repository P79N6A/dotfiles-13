#!/usr/bin/env bash

function backup_mongodb() {
    echo "start to dump mongodb!"
    now=`date +%Y-%m-%d`
    mongodump \
        -h ${REMOTE_MONGO_DB_PATH} \
        -u ${REMOTE_MONGO_DB_USRENAME} \
        -p ${REMOTE_MONGO_DB_PASSWORD} \
        -d ${REMOTE_MONGO_DB_DBNAME} \
        --authenticationDatabase admin \
        -o db-dump-${now}

    if [ $? -ne 0 ]; then
        echo "failed to dump mongodb!"
    else
        echo "success to dump mongodb!"
    fi
}
