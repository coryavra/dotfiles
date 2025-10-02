#!/bin/sh

# This file does 3 main things:
# 1. Creates the $DOTFILES directory at $HOME/.dotfiles
# 2. Copies the zsh/ files from this repository to that local directory
# 3. Symlinks the $HOME/.zshenv -> $DOTFILES/zsh/.zshenv, which becomes ZDOTDIR

# Dotfiles directory
# DOTFILES="$HOME/.dotfiles"
# ZDOTDIR="$DOTFILES/zsh"

echo "Initializing dotfile environment... (doesnt actually do anything atm)"

# echo "Creating directory at $DOTFILES..."
# mkdir -p "$DOTFILES"

# echo "Creating directory at $ZDOTDIR..."
# mkdir -p "$ZDOTDIR"

# # Use the dynamic variable from ./dotfiles.sh, appended with /../zsh/
# echo "Copying zsh files into $ZDOTDIR..."
# cp -R "$SCRIPT_DIR/../zsh/" "$DOTFILES/zsh/"

# ln -sfn "$ZDOTDIR/.zshenv" "$HOME/.zshenv"


# echo "Deleting unnecessary .dotfiles from $HOME"

# # Files
# rm $HOME/.zshenv
# rm $HOME/.zshrc
# rm $HOME/.zsh_history
# rm $HOME/.zcompdump

# # Directories
# rm -R $HOME/.zsh_sessions
