#!/bin/bash

if [ $# -eq 0 ]; then
  echo "Usage: $0 You have to give a file name"
  exit 1
fi

# Loop on all arguments
for FILE in "$@"; do
  echo "=============================="
  echo "Processing: $FILE"

  # Verify if the file exists
  if [ ! -f "$FILE" ]; then
    echo "Error: File not found"
    continue
  fi

  # Print the content of the file
  echo -e "\nContents of $FILE:"
  cat "$FILE"

  # Print files informations
  echo -e "\nFile info:"
  ls -lh "$FILE"

  # Last time modified
  echo -e "\nLast modification timestamp:"
  stat -c "Last modified: %y" "$FILE"

  echo "=============================="
  echo ""
done