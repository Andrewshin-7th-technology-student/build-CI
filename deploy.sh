#!/bin/bash

# Define variables
APP_DIR=~/my-app  # Change this to your application's directory
DEPLOY_DIR=/var/www/my-app  # Change this to your deployment directory
BRANCH_NAME=${CIRCLE_BRANCH:-main}  # Use the current branch name or default to 'main'

# Print the current branch and deployment directory
echo "Deploying branch: $BRANCH_NAME"
echo "Deploying to directory: $DEPLOY_DIR"

# Navigate to the application directory
cd $APP_DIR

# Pull the latest code from the repository
echo "Pulling the latest code..."
git checkout $BRANCH_NAME
git pull origin $BRANCH_NAME

# Install dependencies
echo "Installing dependencies..."
npm install --production

# Build the application (if applicable)
echo "Building the application..."
npm run build  # Modify this if your build command is different

# Copy files to the deployment directory
echo "Deploying files..."
rsync -av --exclude 'node_modules' --exclude '.git' $APP_DIR/ $DEPLOY_DIR/

# Restart the application (if applicable)
echo "Restarting the application..."
pm2 restart my-app  # Modify this command based on your process manager

echo "Deployment completed successfully!"
