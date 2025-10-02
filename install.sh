#!/bin/sh

# For symlinked files, $0 is not reliable
SCRIPT_DIR=$(cd "$(dirname "$0")" && pwd)

# Create symlinks
ln -sfn "$SCRIPT_DIR/zsh/.zshenv" "$HOME/.zshenv"
ln -sfn "$SCRIPT_DIR/zsh/.zshrc" "$HOME/.zshrc"