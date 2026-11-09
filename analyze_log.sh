#!/bin/bash
# Prints a summary of the simulation log
# Usage: bash analyze_log.sh [log_file]

# use the given file, or the default log
log_file=${1:-transit_session.log}

if [ ! -f "$log_file" ]; then
    echo "Error: $log_file not found"
    exit 1
fi

# count sessions, zebra stops and lane changes
sessions=$(grep -c "New session started" "$log_file")
zebra_stops=$(grep -c "Zebra crossing!" "$log_file")
lane_changes=$(grep -c "Changing lane:" "$log_file")

# driver and top speed from the latest trip
driver=$(grep "Driver *:" "$log_file" | tail -n 1 | sed "s/.*: //")
top_speed=$(grep "Top speed *:" "$log_file" | tail -n 1 | sed "s/.*: //")

echo "Sessions: $sessions"
echo "Zebra stops: $zebra_stops"
echo "Lane changes: $lane_changes"
echo "Latest driver: $driver"
echo "Top speed: $top_speed"
