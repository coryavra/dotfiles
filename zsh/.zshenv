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

# Set the theme, to be loaded later in .zshrc
export ZSH_THEME="pentest"

# Other various settings
export SHELL_SESSIONS_DISABLE=1
export PYTHONDONTWRITEBYTECODE=1
export LESSHISTFILE=/dev/null

# Delete variables
unset CURRENT_SCRIPT
unset SCRIPT_DIR
