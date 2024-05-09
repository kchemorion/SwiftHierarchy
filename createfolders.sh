#!/bin/bash

# Prompt for the auth URL and token
read -p "Enter the auth URL: " auth_url
read -p "Enter the token: " token

# Prompt for the file containing the template hierarchy
read -p "Enter the path to the template_hierarchy.txt file: " template_file

# Check if the file exists
if [ ! -f "$template_file" ]; then
  echo "Error: Template file not found."
  exit 1
fi

# Function to create folders recursively
create_folders() {
    local parent="$1"
    local indent="$2"

    while IFS= read -r line; do
        # Remove leading whitespace
        line=$(echo "$line" | sed 's/^[[:space:]]*//')

        # Extract class or subclass name
        folder_name=$(echo "$line" | awk -F ' ' '{print $1}')

        # Create folder in Swift
        swift --os-auth-token "$token" --os-storage-url "$auth_url" post IVDO "$parent/$folder_name"

        # Check for subfolders
        if [[ $line == *" "* ]]; then
            create_folders "$parent/$folder_name" "$indent  "
        fi
    done < <(grep -e '[^[:space:]]' "$template_file")
}

# Start folder creation from the root
create_folders "" ""

echo "Folder structure created successfully."
