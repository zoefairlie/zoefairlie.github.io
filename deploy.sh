#!/bin/bash

# Script to deploy Quarto website to gh-pages branch
# Usage: ./deploy.sh

echo "🔄 Rendering Quarto website..."
quarto render

echo "📦 Copying site files to temporary location..."
cp -r _site /tmp/quarto-site-$(date +%s)
TEMP_SITE="/tmp/quarto-site-$(date +%s)"
cp -r _site "$TEMP_SITE"

echo "📦 Switching to gh-pages branch..."
git checkout gh-pages

echo "🧹 Cleaning gh-pages branch..."
git rm -rf .
rm -rf .DS_Store .Rhistory .Rproj.user .quarto rosm.cache tile_cache

echo "📂 Copying site files from temporary location..."
cp -r "$TEMP_SITE"/* .
cp "$TEMP_SITE"/.nojekyll . 2>/dev/null || true

echo "🚀 Cleaning up temporary files..."
rm -rf "$TEMP_SITE"

echo "✅ Adding and committing changes..."
git add .
git commit -m "Deploy website - $(date '+%Y-%m-%d %H:%M:%S')"

echo "🌐 Pushing to GitHub..."
git push origin gh-pages

echo "🔙 Returning to main branch..."
git checkout main

echo "🎉 Deployment complete! Your website should be updated at https://zoefairlie.github.io"