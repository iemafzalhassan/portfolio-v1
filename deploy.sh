#!/bin/bash

# Deploy script for Hugo portfolio
echo "Starting deployment..."

# Build the site
echo "Building site..."
hugo --minify

# Check if build was successful
if [ $? -eq 0 ]; then
    echo "Build successful!"
    
    # Navigate to public directory (submodule)
    cd public
    
    # Add all changes
    git add .
    
    # Commit changes
    git commit -m "Deploy: $(date)"
    
    # Push to GitHub Pages
    echo "Pushing to GitHub Pages..."
    git push origin main
    
    echo "Deployment complete! Your site should be live at:"
    echo "https://portfolio.iemafzalhassan.in/"
else
    echo "Build failed!"
    exit 1
fi
