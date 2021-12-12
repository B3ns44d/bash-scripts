#!/usr/bin/env bash

function changed {
    git diff --name-only HEAD@{1} HEAD | grep "^$1" >/dev/null 2>&1
}

echo 'checking for changes in yarn.lock'

if changed 'yarn.lock'; then
    echo "📦 yarn.lock changed. Run yarn install to bring your dependencies up to date."
    yarn install
fi

echo 'your yarn.lock is up to date'

exit 0

