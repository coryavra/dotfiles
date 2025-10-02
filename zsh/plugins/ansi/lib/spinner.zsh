

# Define a Unicode spinner.
unicode_spinner() {
  local frames=("⠋" "⠙" "⠹" "⠸" "⠼" "⠴" "⠦" "⠧" "⠇" "⠏")
  while true; do
    for frame in "${frames[@]}"; do
      printf "\r%s Running: %s" "$frame" "$*"
      sleep 0.1
    done
  done
}

# Run any command with a spinner displayed while it executes.
run_with_spinner() {
  # Start the spinner in the background (disowned).
  unicode_spinner "$*" &!
  local spin_pid=$!

  # Execute the provided command with its arguments.
  "$@"
  local cmd_status=$?

  # Terminate the spinner.
  kill $spin_pid 2>/dev/null
  # Clear the spinner line.
  printf "\r"

  # Display a status message.
  if [ $cmd_status -eq 0 ]; then
    echo "[✓] Command '$*' executed successfully."
  else
    echo "[x] Command '$*' failed with exit code $cmd_status."
  fi

  return $cmd_status
}
