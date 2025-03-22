# ZSHENV (Z Shell Environment) File 
# .zshenv -> .zprofile -> .zshrc -> .zlogin -> .zlogout

# This file should be symlinked by its corresponding dotfile in $HOME
# ZSHENV is sourced by EVERY kind of shell (interactive, non-interactive, login, non-login)

# For symlinked files, $0 is not reliable.
# Use the special parameter to get this file's path:
CURRENT_SCRIPT="${(%):-%x}"
SCRIPT_DIR="$(dirname "${CURRENT_SCRIPT:A}")"

# Announcement
printf "> Sourcing file: %s -> %s\n" "${CURRENT_SCRIPT/#$HOME/~}" "${CURRENT_SCRIPT:A}"

# Basic environment variables (no need to export, only needed during startup)
echo ">> Setting global environment variables..."

# Set the theme
export ZSH_THEME="pentest"

# Set the folder where all dotfiles are stored (this folder)
export DOT_DIR=SCRIPT_DIR

# Other various settings
SHELL_SESSIONS_DISABLE=1
PYTHONDONTWRITEBYTECODE=1

