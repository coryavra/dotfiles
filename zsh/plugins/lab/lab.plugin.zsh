#!/bin/sh

# Main dispatcher
lab() {

	# Start by getting the directory of this script
	# We will need it for relative filepaths
	# For executed scripts (NOT sourced), use $0 to get the script's name
	# SCRIPT_DIR=$(cd "$(dirname "$0")" && pwd)
	LAB_DIR="$(dirname "${${(%):-%x}:A}")"

	case "$1" in
		(bin)
			. "$LAB_DIR/bin/bin.sh"
			;;
		(clean)
			. "$LAB_DIR/bin/clean.sh"
			;;
		(theme)
			. "$LAB_DIR/bin/theme.sh"
			;;
		(plugin)
			# Nested dispatcher for 'plugins' subcommands
			case "$2" in
			(add)
				. "$LAB_DIR/bin/plugin_add.sh"
				;;
			(list)
				. "$LAB_DIR/bin/plugin_list.sh"
				;;
			(*)
				echo "Usage: $0 plugin {add|list}"
				;;
			esac
			;;
		(status)
			.  "$LAB_DIR/bin/status.sh"
			;;
		(help)
			. "$LAB_DIR/bin/help.sh"
			;;
		(*)
			. "$LAB_DIR/bin/help.sh"
			;;
	esac

	# Delete variables
	unset LAB_DIR
}

