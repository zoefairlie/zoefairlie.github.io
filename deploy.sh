#!/bin/bash

# Script to deploy Quarto website to gh-pages branch
# Usage: ./deploy.sh

echo "🔄 Rendering Quarto website..."
quarto render

echo "📦 Switching to gh-pages branch..."
git checkout gh-pages

echo "🧹 Cleaning gh-pages branch..."
git rm -rf .
rm -rf .DS_Store .Rhistory .Rproj.user .quarto rosm.cache tile_cache

echo "📂 Copying site files from main branch..."
git checkout main -- _site

echo "🚀 Moving files to root and cleaning up..."
mv _site/* .
mv _site/.nojekyll . 2>/dev/null || true
rmdir _site

echo "✅ Adding and committing changes..."
git add .
git commit -m "Deploy website - $(date '+%Y-%m-%d %H:%M:%S')"

echo "🌐 Pushing to GitHub..."
git push origin gh-pages

echo "🔙 Returning to main branch..."
git checkout main

echo "🎉 Deployment complete! Your website should be updated at https://zoefairlie.github.io"