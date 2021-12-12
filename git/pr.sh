echo "checking last commit..."
LAST_COMMIT_MESSAGE=$(git log -1 --pretty=%B)

echo "last commit message: $LAST_COMMIT_MESSAGE"
if [[ $LAST_COMMIT_MESSAGE == *"Merge pull request"* ]]; then
    echo "last commit is a pull request, skipping..."
    exit 0
fi

echo "checking current branch..."
CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD)

echo "current branch: $CURRENT_BRANCH"
if [[ $CURRENT_BRANCH == "master" ]]; then
    echo "current branch is master, skipping..."
    exit 0
fi

gh pr create --title "$LAST_COMMIT_MESSAGE" -B "master" -b '' -l $1

echo "done"

