#!/usr/bin/env bash

abs_path=$(cd "$(dirname "$0")"; pwd)


function do-github() {
    if [[ $1 == "backup" ]]; then
        echo "start to backup github (${2})'s repos to ${1}"
        exec python3 ${abs_path}/backup.py ${2:-icecory} \
            -o ${1:-$PWD} $(: --output-directory OUTPUT_DIRECTORY) \
            -u ${2:-icecory} $(: USERNAME) \
            $(: -i, --incremental incremental backup) \
            --starred $(: include JSON output of starred repositories in backup) \
            $(: --all-starred include starred repositories in backup) \
            $(: --watched include watched repositories in backup) \
            --followers $(: include JSON output of followers in backup) \
            --following $(: include JSON output of following users in backup) \
            $(: --all include everything in backup) \
            --issues $(: include issues in backup) \
            --issue-comments $(: include issue comments in backup) \
            --issue-events $(: include issue events in backup) \
            --pulls $(: include pull requests in backup) \
            --pull-comments $(: include pull request review comments in backup) \
            --pull-commits $(: include pull request commits in backup) \
            --labels $(: include labels in backup) \
            --hooks $(: include hooks in backup works only when authenticated) \
            --milestones $(: include milestones in backup) \
            --repositories $(: include repository clone in backup) \
            --bare $(: clone bare repositories) \
            --wikis $(: include wiki clone in backup) \
            --gists $(: include gists in backup) \
            $(: --starred-gists include starred gists in backup) \
            --skip-existing $(: skip project \if a backup directory exists) \
            $(: -O, --organization whether or not this is an organization user) \
            --private $(: include private repositories) \
            $(: -F, --fork include forked repositories)
    else
        echo 'Nothing to be done!'
    fi
}

function _do-github() {
    _alternative \
        'args:custom arg:((backup\:"backup github all repos" none\:"none"))'
}
compdef _do-github do-github
