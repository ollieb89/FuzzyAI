#!/bin/bash
# Script to fetch updates from the original CyberArk repo and notify if there are changes

echo "Checking for updates from upstream (cyberark/FuzzyAI)..."
git fetch upstream

UPSTREAM_BRANCH="upstream/main"
LOCAL_BRANCH="development"

BEHIND=$(git rev-list --count $LOCAL_BRANCH..$UPSTREAM_BRANCH)

if [ "$BEHIND" -gt 0 ]; then
    echo "⚠️  Your '$LOCAL_BRANCH' branch is behind '$UPSTREAM_BRANCH' by $BEHIND commits."
    echo "Run 'git merge $UPSTREAM_BRANCH' to update your local branch."
else
    echo "✅ Your '$LOCAL_BRANCH' branch is up to date with upstream."
fi
