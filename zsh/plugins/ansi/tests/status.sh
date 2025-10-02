#!/bin/zsh

# Command to run in the background
(sleep 3; echo "\tDone!") &

# PID of the background command
cmd_pid=$!

# Simple spinner
spinner="/-\|"

# Spinner index
i=0

# Length of the spinner string
spinner_length=${#spinner}

# Display the status bar with a spinner animation
printf "> Running a command in the background, waiting for return... "

# While our command's PID is still active...
while kill -0 $cmd_pid 2>/dev/null; do

    # Calculate the current spinner index (zsh strings are 1-indexed)
    index=$(( (i % spinner_length) + 1 ))

    # Print the spinner character
    printf "\b%s" "${spinner[$index]}"

    # Increment i
    i=$(( i + 1 ))

    # Sleep for a short interval to control the speed of the spinner
    sleep 0.1
done

# Clear the spinner and inform the user that processing is complete
printf "\b \b\nBackground task output:\n"
wait $cmd_pid  # Wait for the background command to finish if it hasn't yet

# Output from the background command
echo "Task completed successfully."

echo "Process completed."
