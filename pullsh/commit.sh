#!/bin/bash

PYTHON_SCRIPT="pullsh/commit_generator.py"
git_commit() {
    # Check if there are uncommitted changes
    if [ -n "$(git status --porcelain)" ]; then
        echo "There are uncommitted changes... Commiting them..."
        
        ## Generate commit message

        # Stage all tracked files, excluding untracked ones
        # git ls-files --modified --cached | xargs git add
        git add -u
        
        COMMIT_MESSAGE=$(python3 "$PYTHON_SCRIPT")
        git commit -m "$COMMIT_MESSAGE"

    else
        echo "Working directory is clean."
    fi

}
