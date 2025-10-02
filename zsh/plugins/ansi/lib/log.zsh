# A collection of functions to aid in printing pretty messages. Requires ANSI plugin + theme definitions

lab_print_info() {
	timestamp=$(date '+%H:%M:%S')
	printf "[${theme_timestamp}${timestamp}${ansi_reset}] [${theme_info}INFO${ansi_reset}] $1${ansi_reset}\n"
}

lab_print_warning() {
	timestamp=$(date '+%H:%M:%S')
	printf "[${theme_timestamp}${timestamp}${ansi_reset}] [${theme_warning}WARNING${ansi_reset}] $1${ansi_reset}\n"
}

lab_print_error() {
	timestamp=$(date '+%H:%M:%S')
	printf "[${theme_timestamp}${timestamp}${ansi_reset}] [${theme_error}ERROR${ansi_reset}] $1${ansi_reset}\n"
}

lab_print_success() {
	timestamp=$(date '+%H:%M:%S')
	printf "[${theme_timestamp}${timestamp}${ansi_reset}] [${theme_success}SUCCESS${ansi_reset}] $1${ansi_reset}\n"
}

lab_print_tip() {
	timestamp=$(date '+%H:%M:%S')
	printf "[${theme_timestamp}${timestamp}${ansi_reset}] [${theme_tip}TIP${ansi_reset}] $1${ansi_reset}\n"
}

lab_print_debug() {
	timestamp=$(date '+%H:%M:%S')
	printf "[${theme_timestamp}${timestamp}${ansi_reset}] [${theme_debug}DEBUG${ansi_reset}] $1${ansi_reset}\n"
}
