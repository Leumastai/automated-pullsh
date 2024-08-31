#!/bin/bash

on_push() {
    echo "Local is ahead. Pushing changes..."
    git push
}


on_pull() {
    echo "Upstream is ahead. Pulling changes..."
    git pull
}