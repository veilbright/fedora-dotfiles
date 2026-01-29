#!/bin/bash

# Parse optional width and height arguments
width=""
height=""
args=()

while [[ $# -gt 0 ]]; do
    case $1 in
        -w)
            width="$2"
            shift 2
            ;;
        -h)
            height="$2"
            shift 2
            ;;
        *)
            args+=("$1")
            shift
            ;;
    esac
done

# Check if an executable argument was provided
if [ ${#args[@]} -eq 0 ]; then
    echo "Usage: $0 [-w width] [-h height] <executable>"
    exit 1
fi

# Get the full command (all arguments) and create a mark from it
executable="${args[*]}"
# Create a safe, consistent mark using MD5 hash to handle long commands
mark="float_$(echo "$executable" | md5sum | cut -d' ' -f1)"

# Check if a container with this mark exists
existing_marks=$(swaymsg -t get_marks)
container_exists=$(echo "$existing_marks" | jq -r ".[] | select(. == \"$mark\")")

if [ -z "$container_exists" ]; then
    # Container doesn't exist, spawn the executable
    
    # Export variables so they're available in the subshell
    export width
    export height
    export mark
    
    # Start monitoring for new windows in the background
    # We'll capture the ID of the next window that opens
    (
        swaymsg -t subscribe -m '["window"]' | while read -r event; do
            event_type=$(echo "$event" | jq -r '.change')
            if [ "$event_type" = "new" ]; then
                container_id=$(echo "$event" | jq -r '.container.id')
                
                # Mark the container immediately
                swaymsg "[con_id=$container_id]" mark "$mark"
                
                # Small delay to ensure window is ready
                sleep 0.1
                
                # Build the command to set window properties
                cmd="[con_mark=$mark] floating enable"
                
                # Add resize commands if width and/or height are specified
                if [ -n "$width" ] && [ -n "$height" ]; then
                    cmd="$cmd, resize set $width px $height px"
                elif [ -n "$width" ]; then
                    cmd="$cmd, resize set width $width px"
                elif [ -n "$height" ]; then
                    cmd="$cmd, resize set height $height px"
                fi
                
                # Apply all commands at once
                swaymsg "$cmd"
                
                # Exit the subscription loop
                exit 0
            fi
        done
    ) &
    
    # Store the PID of the subscription process
    subscribe_pid=$!
    
    # Now spawn the executable
    swaymsg "exec $executable"
    
    # Wait for the subscription to complete (with timeout)
    timeout=100  # 10 seconds (100 * 0.1)
    count=0
    while kill -0 $subscribe_pid 2>/dev/null && [ $count -lt $timeout ]; do
        sleep 0.1
        count=$((count + 1))
    done
    
    # Kill the subscription process if it's still running
    kill $subscribe_pid 2>/dev/null
    wait $subscribe_pid 2>/dev/null
else
    # Container exists, check if it's focused
    is_focused=$(swaymsg -t get_tree | jq -r ".. | select(.marks?) | select(.marks[] == \"$mark\") | .focused")
    
    if [ "$is_focused" = "true" ]; then
        # Container is focused, move to scratchpad
        swaymsg "[con_mark=$mark]" move scratchpad
        swaymsg focus child
    else
        # Container is not focused, move to current output and focus it
        swaymsg "[con_mark=$mark]" move to output current, focus
    fi
fi
