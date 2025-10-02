#!/bin/zsh

# Print the header and body using custom functions
lab_print_h2 "Lab Theme Definitions"
lab_print_body "This is the color theme used by lab. It allows for consistency with styling and readability"
lab_print_body "Each line shows the color's name and code, using a sample of the color"
printf "\n"

# For every variable starting with "theme_"...
for var in ${(k)parameters}; do
if [[ $var == theme_* ]]; then
	# Extract the value of the variable
	color_code=${(P)var}
	
	# Extract the numeric color code
	code="${color_code##*'['38;5;}"
	code="${code%%m*}"

	# Print the variable name and its value
	printf "${color_code}%s: %s\033[0m\n" "$var" "$code"
fi
done
