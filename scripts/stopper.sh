#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
CURRENT_PANE_ID=$(tmux list-panes | grep '(active)' | grep -o '%[0-9]\+')

# Select the pane above and kill it
tmux select-pane -U \; kill-pane \; select-pane -t "$CURRENT_PANE_ID"
