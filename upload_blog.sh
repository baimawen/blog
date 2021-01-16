#!/bin/bash
# Program:
#   备份blog
# History:
# 2020.05.05 GeekWho First release.
# If a command fails then the deploy stops
set -e

printf "\033[0;32mDeploying updates to GitHub...\033[0m\n"


# Add changes to git.
git add .

# Commit changes.
msg="Published on $(date +'%Y-%m-%d %H:%M:%S')"
if [ -n "$*" ]; then
    msg="$*"
fi
git commit -m "$msg"

# Push source and build repos.
git push  origin master