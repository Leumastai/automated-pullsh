#!/bin/bash
set -eo

source pullsh/validate_folder.sh
source pullsh/actions.sh
source pullsh/commit.sh

jq -c '.sync_folders[]' work_dir.json | while read folder; do

    ## get the directories
    clear_folder=$(echo "$folder" | tr -d '"')
    cd "$clear_folder"
    echo "$clear_folder"

    ## commit changes before pull/push
    git_commit

    ## check the status of the folder
    result=$(check_git_folder_sync)
    echo "$result"

    ## depending on the status, perform an action
    if [ "$result" = "None" ]; then
        echo "No changes in upstream and local."
    elif [ "$result" = "pull" ]; then
        echo $(on_pull)
    elif [ "$result" = "push" ]; then
        echo $(on_push)
    fi
    break

done
