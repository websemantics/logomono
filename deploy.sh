#!/bin/bash

set -e

# Base directory for this entire project
BASEDIR=$(cd $(dirname $0) && pwd)
BUILDDIR="$BASEDIR/dist"

mkdir -p "$BUILDDIR"
cp "$BASEDIR/index.html" "$BUILDDIR"
cp "$BASEDIR/style.css" "$BUILDDIR"

# Create a new git repo in public folder
cd "$BASEDIR/dist"
git init

# Set user details
git config user.name "iAyeBot"
git config user.email "iayebot@websemantics.ca"

# First commit, .. horray!
git add .
git commit -m "Deploy to gh-pages"

# Force push ...
git push --force --quiet "https://${GH_TOKEN}@${GH_REF}" master:gh-pages > /dev/null 2>&1
