#!/bin/bash

on_push() {
    echo "Local is ahead. Pushing changes..."
    local_branch=$(git rev-parse --abbrev-ref HEAD)
    git push -u origin "$local_branch"
}


on_pull() {
    echo "Upstream is ahead. Pulling changes..."
    git pull
}