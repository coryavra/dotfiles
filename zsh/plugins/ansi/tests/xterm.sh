#!/bin/zsh

# Print the description using printf
lab_print_h2 "Xterm 256 ANSI Color Palette"
lab_print_body "This is a 256-color palette. Each color is represented by a number 0-255"
lab_print_body "Grouped by family and ordered by shade"
printf "\n"
printf -- "- 0-15: Basic colors and their bright variants\n"
printf -- "- 16-231: Extended range colors\n"
printf -- "- 232-255: Grayscale from dark to light in 24 steps\n"
printf "\n"

# Function to print standard colors (0-15)
print_standard_colors() {
    for i in $(seq 0 7); do
        printf "\033[38;5;%sm%3s\033[0m " "$i" "$i"
    done
    printf "\n"
    for i in $(seq 8 15); do
        printf "\033[38;5;%sm%3s\033[0m " "$i" "$i"
    done
    printf "\n\n"
}

# Function to print extended colors in blocks
print_extended_colors() {
    # First Extended Color Block starting at 16
    print_color_block 16

    printf "\n"

    # Second Extended Color Block starting at 34
    print_color_block 34

    printf "\n"
}

# Function to print a color block starting from a specific color code
print_color_block() {
    start=$1
    cols_per_block=6
    blocks_per_line=3
    rows=6
    number_format="%3s"

    for row in $(seq 0 $((rows - 1))); do
        for block in $(seq 0 $((blocks_per_line - 1))); do
            for col in $(seq 0 $((cols_per_block - 1))); do
                code=$((start + col + block * cols_per_block + row * 36))
                if [ "$code" -le 231 ]; then
                    # Adjust spacing for alignment
                    if [ "$code" -lt 100 ]; then
                        # For codes less than 100, add a space before the number
                        printf "\033[38;5;%sm %2s \033[0m" "$code" "$code"
                    else
                        # For codes 100 and above, no extra space needed
                        printf "\033[38;5;%sm%3s \033[0m" "$code" "$code"
                    fi
                fi
            done
            printf "  "  # Spacing between blocks
        done
        printf "\n"
    done
}

# Function to print grayscale colors (232-255)
print_grayscale_colors() {
    for i in $(seq 232 243); do
        printf "\033[38;5;%sm%3s\033[0m " "$i" "$i"
    done
    printf "\n"
    for i in $(seq 244 255); do
        printf "\033[38;5;%sm%3s\033[0m " "$i" "$i"
    done
    printf "\n"
}

# Main script execution
print_standard_colors
print_extended_colors
print_grayscale_colors
