#!/usr/bin/env bash

function do-mongodb() {
    if [[ $1 == "dump" ]]; then
        echo "start to dump mongodb! in ${REMOTE_MONGO_DB_PATH}"
        now=$(date +%Y-%m-%d)
        mongodump \
            -h ${REMOTE_MONGO_DB_PATH} \
            -u ${REMOTE_MONGO_DB_USERNAME} \
            -p ${REMOTE_MONGO_DB_PASSWORD} \
            -d ${REMOTE_MONGO_DB_DBNAME} \
            --authenticationDatabase admin \
            -o db-dump-${now}

        if [ $? -ne 0 ]; then
            echo "failed to dump mongodb!"
        else
            echo "success to dump mongodb!"
        fi

    elif [[ $1 == "login" ]]; then
        mongo ${REMOTE_MONGO_DB_PATH} \
            -u ${REMOTE_MONGO_DB_USERNAME} \
            -p ${REMOTE_MONGO_DB_PASSWORD} \
            --authenticationDatabase admin

    else
        echo "Nothing to be done, please input [dump]"
    fi
}
