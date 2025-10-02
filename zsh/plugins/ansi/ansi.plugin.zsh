#!/bin/zsh

# Get this script's current directory for relative execution
DIR="$(cd "$(dirname "$0")" && pwd)"

# Source everything in lib
for file in $DIR/lib/*.zsh; do
	source $file
done

function color {
	# Color - Basic 16 Palette
	source $DIR/tests/basic.sh

	# Color - Xterm 256 Palette
	source "$DIR/tests/xterm.sh"

	# Color - Theme Definitions
	source "$DIR/tests/theme.sh"
}

function demo {
	# Introduction
	lab_print_h1 "Lab Demo"
	lab_print_body "This script showcases various lab features from the shell library"

	# Color - Basic 16 Palette
	source $DIR/tests/basic.sh

	# Color - Xterm 256 Palette
	source "$DIR/tests/xterm.sh"

	# Color - Theme Definitions
	source "$DIR/tests/theme.sh"

	# Font - Text Effects
	source "$DIR/tests/font.sh"

	# Print - Message Types
	source "$DIR/tests/print.sh"

	# Print - Markdown
	source "$DIR/tests/markdown.sh"

	# Loading and status bars
	source "$DIR/tests/loading_bar.sh"
	source "$DIR/tests/status.sh"

	# Lab info
	source "$DIR/tests/info.sh"
}