#!/bin/bash
set -e # Exit immediately if a command exits with a non-zero status.

# 1. Set the Date
CURRENT_DATE=$(date +%F)
ARTICLE_PATH="src/content/blog/${CURRENT_DATE}.md"

echo "Creating article for ${CURRENT_DATE}"

# 2. This is a placeholder for the news fetching logic.
# In a real run, this would be populated by the AI model.
NEWS_CONTENT="---
title: 'AI News Briefing: ${CURRENT_DATE}'
description: 'Your daily summary of the latest in LLMs, AI Agents, and Computer Vision.'
pubDate: '${CURRENT_DATE}'
heroImage: '/blog-placeholder-2.jpg'
---

## Top AI News for ${CURRENT_DATE}

### Placeholder

*   This is a test article generated to debug the git push functionality.
"

# 3. Write the Article
echo "$NEWS_CONTENT" > "$ARTICLE_PATH"
echo "Article created at ${ARTICLE_PATH}"

# 4. Commit and Push
echo "Authenticating git with GitHub CLI..."
gh auth setup-git

echo "Configuring git user..."
git config --global user.name "Hermes Agent"
git config --global user.email "hermes-agent@localhost"

echo "Pulling latest changes..."
git pull origin main --rebase

echo "Adding new article..."
git add "$ARTICLE_PATH"

echo "Committing new article..."
git commit -m "feat: Add AI news for ${CURRENT_DATE}"

echo "Pushing to origin..."
git push origin main
echo "Push complete!"
