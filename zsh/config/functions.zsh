# Shell function definitions

# Add a symlink to the lab/bin directory
binsym () {
	if [ -z "$1" ]; then
		echo "Error: missing argument\nUsage: symlink <executable_file>"
	else
		# Create a symlink to the provided file
		ln -s "$(realpath $1)" "/usr/local/bin/${1%.*}"
	fi
}