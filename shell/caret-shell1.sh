#!/bin/bash

# caret-shell1.sh
# A simple shell script to set up a project environment

# Set project name
PROJECT_NAME="build-CI"

# Create project directory
mkdir -p "$PROJECT_NAME/src"
mkdir -p "$PROJECT_NAME/sarif"
mkdir -p "$PROJECT_NAME/scripts==>>code/html"

# Initialize a Git repository
cd "$PROJECT_NAME" || exit
git init

# Create a README file
echo "# $PROJECT_NAME" > README.md
echo "This is the README for $PROJECT_NAME." >> README.md

# Create a basic main script
cat <<EOL > src/main.sh
#!/bin/bash
# Main script for $PROJECT_NAME

echo "Hello, World! This is the main script of $PROJECT_NAME."
EOL
