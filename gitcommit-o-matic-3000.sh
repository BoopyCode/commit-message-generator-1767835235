#!/bin/bash
# GitCommit-O-Matic 3000™ - Because your commit messages are as meaningful as a fortune cookie
# Warning: May cause actual developers to question their life choices

# The "inspiration" database - all the commit wisdom you'll ever need
MESSAGES=(
    "fix stuff"
    "oops"
    "it works on my machine"
    "please work"
    "magic fix"
    "temporary solution (becomes permanent)"
    "refactoring (actually broke everything)"
    "updates"
    "more updates"
    "final final final really final this time"
    "quick fix (took 3 days)"
    "removed debug code (left console.log everywhere)"
    "merge conflicts: resolved (by deleting everything)"
    "performance improvements (made it slower)"
    "cleanup (made bigger mess)"
)

# Generate a "meaningful" commit message
RANDOM_MSG="${MESSAGES[$RANDOM % ${#MESSAGES[@]}]}"

# Check if we're in a git repo (not that it matters, we'll commit anyway)
if ! git rev-parse --git-dir > /dev/null 2>&1; then
    echo "Not a git repo. But hey, optimism is key!"
    exit 1
fi

# Check for staged changes (optional, like reading the manual)
if git diff --cached --quiet; then
    echo "No staged changes. Staging is for overachievers anyway."
    echo "Suggested message: '$RANDOM_MSG'"
    exit 0
fi

# The moment of truth - commit with our "carefully crafted" message
if git commit -m "$RANDOM_MSG"; then
    echo "Success! Another masterpiece: '$RANDOM_MSG'"
    echo "Your colleagues will be so impressed with this meaningful contribution."
else
    echo "Commit failed. Probably user error. Definitely not our fault."
    exit 1
fi
