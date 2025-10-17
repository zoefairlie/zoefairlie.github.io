#!/bin/bash#!/bin/bash#!/bin/bash



# Deploy script to overwrite gh-pages branch with main branch content

echo "🔄 Rendering Quarto website..."

quarto render# Deploy script to overwrite gh-pages branch with main branch content# Simple deploy script for GitHub Pages from main branch



echo "📁 Saving current changes to main branch..."echo "🔄 Rendering Quarto website..."echo "🔄 Rendering Quarto website..."

git add .

git commit -m "Pre-deploy save - $(date '+%Y-%m-%d %H:%M:%S')" || echo "No changes to commit"quarto renderquarto render

git push origin main



echo "🔄 Switching to gh-pages branch..."

git checkout gh-pagesecho "📁 Saving current changes to main branch..."echo "� Copying site files to root directory..."



echo "🗑️ Clearing gh-pages branch..."git add .# Copy built files from _site to root, excluding source files

git rm -rf .

git commit -m "Pre-deploy save - $(date '+%Y-%m-%d %H:%M:%S')" || echo "No changes to commit"cp _site/*.html .

echo "📥 Copying everything from main branch..."

git checkout main -- .git push origin maincp _site/*.json .



echo "✅ Adding and committing all files to gh-pages..."cp _site/*.css .

git add .

git commit -m "Deploy website - $(date '+%Y-%m-%d %H:%M:%S')"echo "🔄 Switching to gh-pages branch..."cp -r _site/site_libs .



echo "🌐 Pushing to GitHub Pages..."git checkout gh-pagescp _site/.nojekyll .

git push origin gh-pages



echo "🔄 Returning to main branch..."

git checkout mainecho "🗑️ Clearing gh-pages branch..."echo "✅ Adding and committing changes..."



echo "🎉 Deployment complete! Your website should be updated at https://zoefairlie.github.io"git rm -rf .git add *.html *.json *.css site_libs/ .nojekyll

git commit -m "Deploy website - $(date '+%Y-%m-%d %H:%M:%S')"

echo "📥 Copying everything from main branch..."

git checkout main -- .echo "🌐 Pushing to GitHub..."

git push origin main

echo "✅ Adding and committing all files to gh-pages..."

git add .echo "🎉 Deployment complete! Your website should be updated at https://zoefairlie.github.io"
git commit -m "Deploy website - $(date '+%Y-%m-%d %H:%M:%S')"

echo "🌐 Pushing to GitHub Pages..."
git push origin gh-pages

echo "🔄 Returning to main branch..."
git checkout main

echo "🎉 Deployment complete! Your website should be updated at https://zoefairlie.github.io"