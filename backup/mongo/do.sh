#!/usr/bin/env bash

function do-mongo() {
    if [[ $1 == "dump" ]]; then
        echo "start to dump mongo db! in ${REMOTE_MONGO_DB_PATH}"
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
        echo "Nothing to be done!"
    fi
}

function _do-mongo() {
    _alternative 'args:custom arg:((dump\:"dump mongo db" login\:"login mongo db"))'
}
compdef _do-mongo do-mongo
