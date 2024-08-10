#!/bin/bash

# Build the mdBook
mdbook build

# Create a new gh-pages branch (or reset it if it exists)
git worktree add gh-pages
git checkout --orphan gh-pages

# Copy the book contents to the gh-pages branch
cp -r book/* gh-pages/

# Configure Git user
git config user.name "Deploy from CI"
git config user.email ""

# Commit and push the changes
cd gh-pages
git add -A
git commit -m 'deploy new book'
git push origin gh-pages --force

# Clean up
cd ..
git worktree remove gh-pages
