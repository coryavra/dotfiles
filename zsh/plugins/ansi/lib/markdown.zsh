# A collection of functions to aid in printing pretty messages. Requires ANSI plugin + theme definitions

lab_print_newline() {
	printf "\n"
}

# Markdown
lab_print_h1() {
	printf "\n"
	printf "${theme_markdown_heading}"
	printf "${ansi_underline}"
	printf " # $1"
	printf "${ansi_reset}\n\n"
}

lab_print_h2() {
	printf "\n"
	printf "${theme_markdown_heading}"
	printf "${ansi_underline}"
	printf " ## $1"
	printf "${ansi_reset}\n\n"
}

lab_print_h3() {
	printf "\n"
	printf "${theme_markdown_heading}"
	printf "${ansi_underline}"
	printf " ### $1"
	printf "${ansi_reset}\n\n"
}

lab_print_h4() {
	printf "\n"
	printf "${theme_markdown_heading}"
	printf "${ansi_underline}"
	printf " #### $1"
	printf "${ansi_reset}\n\n"
}

lab_print_h5() {
	printf "\n"
	printf "${theme_markdown_heading}"
	printf "${ansi_underline}"
	printf " ##### $1"
	printf "${ansi_reset}\n\n"
}

lab_print_h6() {
	printf "\n"
	printf "${theme_markdown_heading}"
	printf "${ansi_underline}"
	printf " ###### $1"
	printf "${ansi_reset}\n\n"
}

lab_print_hr() {
	printf "${theme_markdown_line}"
	printf "________________________________________________________________________________"
	printf "${ansi_reset}\n"
}

lab_print_body() {
	printf "$1"
	printf "${ansi_reset}\n"
}

lab_print_code() {
	printf "${theme_markdown_code}"
	printf "$1"
	printf "${ansi_reset}"
}

lab_print_link() {
	printf "${theme_markdown_link}"
	printf "${ansi_underline}"
	printf "$1"
	printf "${ansi_reset}"
}

lab_print_block() {
	printf "${theme_markdown_block}$1${ansi_reset}\n"
}

lab_print_list_item() {
	printf "${theme_markdown_list_item} - $1${ansi_reset}\n"
}