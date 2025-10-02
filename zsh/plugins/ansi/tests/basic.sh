#!/bin/zsh

# Print description of the ANSI color palette
lab_print_h2 "Basic 16 ANSI Color Palette"
lab_print_body "This is a 16-color palette. Each color is shown with its ANSI numerical value"
lab_print_body "These ANSI colors are printed as '\\\\033[<code>m', where <code> is a number"
lab_print_newline
lab_print_list_item "30-37: Basic colors"
lab_print_list_item "90-97: Bright variants"
lab_print_newline

# Demonstrate the ANSI color palette
printf "${ansi_foreground_black}Black (30)\t${ansi_foreground_bright_black}Bright Black (90)${ansi_reset}\n"
printf "${ansi_foreground_red}Red (31)\t${ansi_foreground_bright_red}Bright Red (91)${ansi_reset}\n"
printf "${ansi_foreground_green}Green (32)\t${ansi_foreground_bright_green}Bright Green (92)${ansi_reset}\n"
printf "${ansi_foreground_yellow}Yellow (33)\t${ansi_foreground_bright_yellow}Bright Yellow (93)${ansi_reset}\n"
printf "${ansi_foreground_blue}Blue (34)\t${ansi_foreground_bright_blue}Bright Blue (94)${ansi_reset}\n"
printf "${ansi_foreground_magenta}Magenta (35)\t${ansi_foreground_bright_magenta}Bright Magenta (95)${ansi_reset}\n"
printf "${ansi_foreground_cyan}Cyan (36)\t${ansi_foreground_bright_cyan}Bright Cyan (96)${ansi_reset}\n"
printf "${ansi_foreground_white}White (37)\t${ansi_foreground_bright_white}Bright White (97)${ansi_reset}\n"
