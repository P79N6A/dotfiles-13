#!/usr/bin/env bash

function do-git-unshallow() {
    git fetch --tags
    git config remote.origin.fetch '+refs/heads/*:refs/remotes/origin/*'
    git fetch --unshallow
}

function do-git-user() {
    if [[ $1 == "ice" ]]; then
        git config user.name ${SELF_NAME} $2
        git config user.email ${SELF_EMAIL} $2
    elif [[ $1 == "work" ]]; then
        git config user.name ${WORK_NAME} $2
        git config user.email ${WORK_EMAIL} $2
    else
        echo 'Nothing to be done!'
    fi
}

function _do-git-user() {
    _alternative 'args:custom arg:((ice\:"for self" work\:"for work" --global\:"available for global"))'
}

compdef _do-git-user do-git-user
