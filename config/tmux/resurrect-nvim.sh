#!/bin/bash
# This script ensures nvim is started with session restore

if [[ "$1" == *"nvim"* ]] || [[ "$1" == *"vim"* ]]; then
    # Start nvim in the saved directory
    cd "$2" 2>/dev/null || true
    exec nvim
else
    # Execute the original command
    exec $@
fi
