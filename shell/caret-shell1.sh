#!/bin/bash

# caret-shell1.sh
# A simple shell script to set up a project environment

# Set project name
PROJECT_NAME="MyProject"

# Create project directory
mkdir -p "$PROJECT_NAME/src"
mkdir -p "$PROJECT_NAME/bin"
mkdir -p "$PROJECT_NAME/docs"

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

# Make the main script executable
chmod +x src/main.sh

# Create a basic documentation file
echo "Documentation for $PROJECT_NAME" > docs/README.md

# Print completion message
echo "Project $PROJECT_NAME has been set up successfully!"
