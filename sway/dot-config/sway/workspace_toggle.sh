#!/usr/bin/env bash
# Usage: workspace_toggle <workspace-name> [command-to-run-if-new]

TARGET="$1"
CMD="$2"
STATE_FILE="${XDG_RUNTIME_DIR}/sway_prev_workspace"

if [[ -z "$TARGET" ]]; then
    echo "Usage: $0 <workspace-name> [command]" >&2
    exit 1
fi

# Get the current workspace name
CURRENT=$(swaymsg -t get_workspaces | jq -r '.[] | select(.focused == true) | .name')

# If already on the target workspace, switch to previous
if [[ "$CURRENT" == "$TARGET" ]]; then
    PREV=$(cat "$STATE_FILE" 2>/dev/null)
    if [[ -n "$PREV" ]]; then
        echo "$CURRENT" > "$STATE_FILE"
        swaymsg "workspace $PREV"
    fi
    exit 0
fi

# Check if the target workspace already exists
EXISTS=$(swaymsg -t get_workspaces | jq -r --arg name "$TARGET" '.[] | select(.name == $name) | .name')

# Store current workspace as previous
echo "$CURRENT" > "$STATE_FILE"

# Switch to the target workspace
swaymsg "workspace $TARGET"

# If the workspace didn't exist and a command was given, launch it
if [[ -z "$EXISTS" && -n "$CMD" ]]; then
    swaymsg "exec $CMD"
fi
