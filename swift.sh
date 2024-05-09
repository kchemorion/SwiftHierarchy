#!/bin/bash

# Step 1: Install OpenStack CLI Utilities
echo "Installing OpenStack CLI utilities..."
pip install python-openstackclient python-swiftclient

# Step 2: Configure the environment
read -p "Enter the auth URL: " auth_url
read -p "Enter the token: " token

# Step 3: Prompt for the prefix
read -p "Enter a prefix to add to the file: " prefix

# Check if a prefix is provided
if [[ -z "$prefix" ]]; then
  echo "Error: Please enter a prefix."
  exit 1
fi

# Step 4: Loop through all files in the current directory
for filename in *; do
  # Skip hidden files and directories
  if [[ "$filename" == "." || "$filename" == ".." ]]; then
    continue
  fi

  # Construct the target path in OpenStack storage
  target_path="$prefix-$filename"

  # Upload the file to Swift with the provided prefix
  swift --os-auth-token $token --os-storage-url $auth_url upload IVDO "$filename" --object-name "$target_path"

  # Check for upload success
  if [[ $? -eq 0 ]]; then
    echo "File $filename uploaded successfully to $target_path"
  else
    echo "Error uploading file $filename."
  fi
done

echo "Finished processing all files in the current directory."
