#!/bin/bash
# Ella Portfolio - Deploy to Vercel via GitHub
# Run this from your Portfolio folder: ./deploy.sh

set -e

echo "=== Ella Portfolio Deploy ==="

# Check if git is installed
if ! command -v git &> /dev/null; then
    echo "Error: git is not installed. Please install it first."
    exit 1
fi

# Check if we're in the right folder
if [ ! -d "ella-portfolio" ] || [ ! -d "Portfolio assets" ]; then
    echo "Error: Please run this script from your Portfolio folder"
    echo "(The folder containing 'ella-portfolio' and 'Portfolio assets')"
    exit 1
fi

# Initialize git repo
echo "Initializing git repository..."
git init -b main

# Create .gitignore
cat > .gitignore << 'GITIGNORE'
.DS_Store
Thumbs.db
*.tmp
GITIGNORE

# Add all files
echo "Adding files..."
git add -A

# Commit
echo "Creating initial commit..."
git commit -m "Initial deploy of Ella Portfolio"

# Add remote and push
echo "Pushing to GitHub..."
git remote add origin https://github.com/Ellawpy/ella-portfolio.git 2>/dev/null || git remote set-url origin https://github.com/Ellawpy/ella-portfolio.git
git push -u origin main --force

echo ""
echo "=== Done! ==="
echo "Your code is now on GitHub: https://github.com/Ellawpy/ella-portfolio"
echo ""
echo "Now go to Vercel to import it:"
echo "https://vercel.com/new?teamSlug=ellawpys-projects"
echo "Select 'ella-portfolio' from the list and click Deploy."
