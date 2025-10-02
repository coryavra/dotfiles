# ZSHRC (Z Shell Run Commands) File 
# .zshenv -> .zprofile -> .zshrc -> .zlogin -> .zlogout

# This file should be symlinked by its corresponding dotfile in $HOME
# ZSHRC is sourced ONLY by INTERACTIVE shells (Terminal.app, VS Code Panel terminal, etc.)

# For symlinked files, $0 is not reliable.
# Use the special parameter to get this file's path:
CURRENT_SCRIPT="${(%):-%x}"
SCRIPT_DIR="$(dirname "${CURRENT_SCRIPT:A}")"

# Announcement
printf "> Sourcing file: %s -> %s\n" "${CURRENT_SCRIPT/#$HOME/~}" "${CURRENT_SCRIPT:A}"

# Load all configuration files
printf ">> Sourcing configuration files...\n"
for config_file in "$SCRIPT_DIR"/config/*.zsh; do
	config_name=$(basename "$config_file")
	echo ">>> Configuring: $config_name"
	source "$config_file"
done

# Load zsh plugins
printf ">> Sourcing plugins...\n"
for plugin_dir in "$SCRIPT_DIR"/plugins/*; do
	if [ -d "$plugin_dir" ]; then
		plugin_name=$(basename "$plugin_dir")
		plugin_file="$plugin_dir/$plugin_name.plugin.zsh"
		if [ -f "$plugin_file" ]; then
			echo ">>> Loading plugin: $plugin_name"
			source "$plugin_file"
		else
			echo ">>> Plugin file not found for: $plugin_name"
		fi
	fi
done

# Load theme, defaulting to pentest
if [[ -z "$ZSH_THEME" ]]; then
	ZSH_THEME="pentest"
fi
printf ">> Loading theme: $ZSH_THEME...\n"
source "$SCRIPT_DIR/themes/$ZSH_THEME.zsh-theme"

# Delete variables
unset CURRENT_SCRIPT
unset SCRIPT_DIR
