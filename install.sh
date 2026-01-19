#!/bin/bash
# Install Ralph to a target directory
# Usage: ./install.sh [target_directory]
#   If target_directory is omitted, installs to current directory

RALPH_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TARGET_DIR="${1:-$(pwd)}"

echo "Installing Ralph to: $TARGET_DIR"
echo "  From: $RALPH_DIR"

# Create target directory if it doesn't exist
mkdir -p "$TARGET_DIR"

# Copy files
cp "$RALPH_DIR/ralph.sh" "$TARGET_DIR/"
cp "$RALPH_DIR/prompt.md" "$TARGET_DIR/"

# Copy skills if they exist
if [ -d "$RALPH_DIR/.opencode/skills" ]; then
  mkdir -p "$TARGET_DIR/.opencode"
  cp -r "$RALPH_DIR/.opencode/skills" "$TARGET_DIR/.opencode/"
  echo "✓ Copied skills to $TARGET_DIR/.opencode/skills/"
fi

# Make ralph.sh executable
chmod +x "$TARGET_DIR/ralph.sh"

echo ""
echo "✓ Installed ralph.sh and prompt.md to $TARGET_DIR"
echo ""
echo "Next steps:"
echo "  1. Create a prd.json file (see prd.json.example)"
echo "  2. Run: $TARGET_DIR/ralph.sh [max_iterations]"
