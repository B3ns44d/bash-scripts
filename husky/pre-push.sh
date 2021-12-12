#!/bin/bash

echo -e "===\n>> Checking branch name..."

BRANCH=$(git rev-parse --abbrev-ref HEAD)
PROTECTED_BRANCHES="^(master|dev)"

if [[ "$BRANCH" =~ $PROTECTED_BRANCHES ]]; then
    echo -e "\n🚫 Cannot push to remote $BRANCH branch, please create your own branch and use PR." && exit 1
fi

echo -e ">> Finish checking branch name"

exit 0

