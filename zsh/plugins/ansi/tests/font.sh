#!/bin/zsh

# Function to print the description
lab_print_h2 "Font Styles"
lab_print_body "Demonstration of ANSI text decorations and attributes"

# Function to demonstrate the font styles
printf "\n"
printf "This is a message with ${ansi_bold}bold text.${ansi_reset}\n"
printf "This is a message with ${ansi_dim}dim text.${ansi_reset}\n"
printf "This is a message with ${ansi_underline}underlined text.${ansi_reset}\n"
printf "This is a message with ${ansi_bold}${ansi_underline}bold and underlined text.${ansi_reset}\n"
printf "This is a message with ${ansi_blink}blinking text.${ansi_reset}\n"
printf "This is a message with ${ansi_reverse_video}inverted text.${ansi_reset}\n"
printf "This is a message with hidden ${ansi_invisible}but still selectable${ansi_reset} text.\n"