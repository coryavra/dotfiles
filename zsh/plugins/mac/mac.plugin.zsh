#!/bin/sh

mac() {

	# Start by getting the directory of this script
	# We will need it for relative filepaths
	# For executed scripts (NOT sourced), use $0 to get the script's name
	# SCRIPT_DIR=$(cd "$(dirname "$0")" && pwd)
	LAB_DIR="$(dirname "${${(%):-%x}:A}")"

	case "$1" in
		(status) echo "this is a macbook air" ;;
		(*) echo "this is a macbook air" ;;
	esac

	# Delete variables
	unset LAB_DIR
}