#!/bin/zsh

# Colors
RESET="\033[0m"
BOLD_BLUE="\033[1;34m"
BOLD_GREEN="\033[1;32m"



lab_print_hr
lab_print_info "LAB_ROOT" "$LAB_ROOT"

printf -- "--------------------------------------------------------------------------------\n"

# Lab Environment Variables
printf "${BOLD_GREEN}LAB Root:${RESET}\t\t%s\n" "$LAB_ROOT"
printf "${BOLD_GREEN}LAB Theme:${RESET}\t\t%s\n" "$LAB_THEME"
printf "${BOLD_GREEN}Scripts:${RESET}\t\t%s\n" "$(find "$LIBRARY" -type f | grep '.sh' -c)"
printf -- "--------------------------------------------------------------------------------\n"

# Version Information
echo "${BOLD_GREEN}OS Kernel:${RESET}\t\t$(uname -s)"
echo "${BOLD_GREEN}Kernel Version:${RESET}\t\t$(uname -r)"
echo "${BOLD_GREEN}ZSH Version:${RESET}\t\t$(zsh --version)"
echo "${BOLD_GREEN}Python Version:${RESET}\t\t$(python3 --version)"
printf -- "--------------------------------------------------------------------------------\n"

# TTY and Shell Information
printf "Login shell:\t\t$SHELL\n"
printf "Current shell:\t\t$(ps -p $$ -o comm=)\n"
printf "Current TTY:\t\t$(tty)\n"
printf -- "--------------------------------------------------------------------------------\n"

# PROFILING

# Is brew installed?
if command -v brew &> /dev/null; then
  echo "${BOLD_GREEN}Homebrew:${RESET}\t\tInstalled"
else
  echo "${BOLD_GREEN}Homebrew:${RESET}\t\tNot Installed"
fi

# list all brew installs
# list all user-installed apps

# Background processes
# is the docker daemon running?
# is ollama running?

# Colors
BOLD="\033[1m"
RESET="\033[0m"

# OS Info
OS_NAME="$(sw_vers -productName)"         # e.g., "macOS"
OS_VERSION="$(sw_vers -productVersion)"   # e.g., "10.15.7"
OS_BUILD="$(sw_vers -buildVersion)"       # e.g., "19H15"
ARCH="$(uname -m)"                        # e.g., "x86_64"
OS="$OS_NAME $OS_VERSION (Build $OS_BUILD) $ARCH"

# Host Model (fallback to hostname if not macOS or something else fails)
HOST_MODEL="$(sysctl -n hw.model 2>/dev/null || hostname)"

# Kernel
KERNEL="$(uname -r)"

# Uptime (grabs the portion after 'up ' and before the first comma)
UPTIME="$(uptime | sed 's/.* up \([^,]*\), .*/\1/')"

# Brew Packages (show "N/A" if brew is missing)
if command -v brew &>/dev/null; then
  PACKAGES="$(brew list | wc -l | tr -d '[:space:]')"
else
  PACKAGES="N/A"
fi

# Shell
SHELL_NAME="$(basename "$SHELL")"
SHELL_VERSION="$($SHELL --version 2>/dev/null | head -n1 | awk '{print $2}')"

# Resolution (joins multiple display resolutions with a comma)
RESOLUTION="$(system_profiler SPDisplaysDataType 2>/dev/null \
  | awk -F': ' '/Resolution/ {print $2}' \
  | paste -sd ', ' -)"

# Desktop Environment & Window Manager (macOS defaults)
DE="Aqua"
WM="Quartz Compositor"

# WM Theme (check if Dark Mode is enabled)
if [[ "$(defaults read -g AppleInterfaceStyle 2>/dev/null)" == "Dark" ]]; then
  WM_THEME="Blue (Dark)"
else
  WM_THEME="Blue (Light)"
fi

# CPU
CPU="$(sysctl -n machdep.cpu.brand_string 2>/dev/null)"

# GPU (if multiple GPUs, they’ll be joined by comma)
GPU="$(system_profiler SPDisplaysDataType 2>/dev/null \
  | awk -F': ' '/Chipset Model/ {print $2}' \
  | paste -sd ', ' -)"

# Memory (convert from bytes to MiB)
MEM_BYTES="$(sysctl -n hw.memsize 2>/dev/null)"
MEM_MIB=$((MEM_BYTES / 1024 / 1024))

# Print everything
echo -e "${BOLD}OS:${RESET}             $OS"
echo -e "${BOLD}Host:${RESET}           $HOST_MODEL"
echo -e "${BOLD}Kernel:${RESET}         $KERNEL"
echo -e "${BOLD}Uptime:${RESET}         $UPTIME"
echo -e "${BOLD}Packages (brew):${RESET} $PACKAGES"
echo -e "${BOLD}Shell:${RESET}          $SHELL_NAME $SHELL_VERSION"
echo -e "${BOLD}Resolution:${RESET}     $RESOLUTION"
echo -e "${BOLD}DE:${RESET}             $DE"
echo -e "${BOLD}WM:${RESET}             $WM"
echo -e "${BOLD}WM Theme:${RESET}       $WM_THEME"
echo -e "${BOLD}CPU:${RESET}            $CPU"
echo -e "${BOLD}GPU:${RESET}            $GPU"
echo -e "${BOLD}Memory:${RESET}         ${MEM_MIB}MiB"
