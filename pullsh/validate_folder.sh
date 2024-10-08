#!/bin/bash

check_git_folder_sync() {
    ## verify if the folder is a git initialized one
    if ! git rev-parse  --is-inside-work-tree > /dev/null 2>&1; then
        echo "Not inside a git repository."
        return 1
    fi

    ## Fetch update from upstream
    git fetch > /dev/null 2>&1

    ## Select current working bracnh
    local_branch=$(git rev-parse --abbrev-ref HEAD)

    ## Get upstream branch tracking the remote
    # if no upstream, return push to upstream
    # upstream_branch=$(git rev-parse --abbrev-ref "@{upstream}")
    if ! upstream_branch=$(git rev-parse --abbrev-ref "@{upstream}" 2>/dev/null); then
        echo "push"
        return 0
    fi

    # Get the commit hashes of the local and upstream branches
    local_commit=$(git rev-parse "$local_branch")
    upstream_commit=$(git rev-parse "$upstream_branch")

    if [ "$local_commit" = "$upstream_commit" ]; then
        echo "None"
    elif [ "$(git rev-list --count "$local_commit".."$upstream_commit")" -gt 0 ]; then
        echo "pull"
    elif [ "$(git rev-list --count "$upstream_commit".."$local_commit")" -gt 0 ]; then
        echo "push"
    fi
}
