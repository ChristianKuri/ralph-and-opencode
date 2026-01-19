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
if [ -d "$TARGET_DIR/.opencode/skills" ]; then
    echo "✓ Skills are available in $TARGET_DIR/.opencode/skills/"
fi
echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "Next Steps:"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "1. CREATE A PRD MARKDOWN FILE"
echo "   Use the PRD skill in OpenCode to generate a requirements document:"
echo ""
echo "   Load the prd skill and create a PRD for [your feature description]"
echo ""
echo "   The skill will ask clarifying questions and save the output to:"
echo "   tasks/prd-[feature-name].md"
echo ""
echo "2. CONVERT PRD TO JSON FORMAT"
echo "   Use the Ralph skill to convert the markdown PRD to prd.json:"
echo ""
echo "   Load the ralph skill and convert tasks/prd-[feature-name].md to prd.json"
echo ""
echo "   This creates prd.json with user stories structured for autonomous execution."
echo "   See prd.json.example for reference."
echo ""
echo "3. RUN RALPH"
echo "   Once prd.json is ready, start the autonomous agent loop:"
echo ""
echo "   $TARGET_DIR/ralph.sh [max_iterations]"
echo ""
echo "   Default is 10 iterations. Ralph will:"
echo "   • Create a feature branch (from PRD branchName)"
echo "   • Pick the highest priority story where passes: false"
echo "   • Implement that single story"
echo "   • Run quality checks (typecheck, tests)"
echo "   • Commit if checks pass"
echo "   • Update prd.json to mark story as passes: true"
echo "   • Append learnings to progress.txt"
echo "   • Repeat until all stories pass or max iterations reached"
echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "Tips:"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "• Skills are automatically discovered from .opencode/skills/ (project-local)"
echo "• Each PRD story should be small enough to complete in one context window"
echo "• Frontend stories should include 'Verify in browser using dev-browser skill'"
echo "• Check progress: cat prd.json | jq '.userStories[] | {id, title, passes}'"
echo ""
