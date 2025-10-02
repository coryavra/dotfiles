#!/bin/zsh

# Temporary file to hold output
temp_file=$(mktemp)

# Command to run in the background
(sleep 3; echo "Command completed! This line is the result." > "$temp_file") &

# PID of the background command
cmd_pid=$!

# Initialize the progress
total_steps=30  # Number of steps to represent 100%
sleep_time=0.1  # Sleep 0.1 seconds at each step

# Print the initial part of the loading bar
printf "Loading: ["

# Current step initialization
current_step=0

# Loop to update the loading bar
while [ "$current_step" -lt "$total_steps" ]; do
    printf "="  # Print a single step
    sleep $sleep_time
    current_step=$((current_step + 1))
done

# Complete the bar with spaces if needed and close the bracket
printf "%$((total_steps - current_step))s"  # Fill the rest with spaces (if any)
printf "] 100%%\n"  # Print the completion percentage and new line

# Wait for the background command to complete
wait $cmd_pid

# Read and display the output from the temporary file
echo "Background command output:"
cat "$temp_file"

# Clean up: remove the temporary file
rm "$temp_file"

echo "Process completed."
