#!/bin/bash

# Backup directory path
backup_dir="backup"

# Create a backup directory if it doesn't exist
mkdir -p "$backup_dir"

# Loop through all files in the current directory
for file in *.json; do
    # Check if the file is a regular file (not a directory)
    if [ -f "$file" ]; then
        # Create a backup of the original file
        cp "$file" "$backup_dir/$file.backup"

        # Perform the replacements using sed and save the changes in the original file
        sed -i 's/\\n/<br>/g; s/<ncode>/<code>/g; s/<\/ncode>/<\/code>/g' "$file"
        
        echo "Replacements done for: $file"
    fi
done
