#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
CURRENT_PANE_ID=$(tmux list-panes | grep '(active)' | grep -o '%[0-9]\+')

tmux split-window -b -l 30% "$CURRENT_DIR/runner.sh $CURRENT_PANE_ID" \; select-pane -t "$CURRENT_PANE_ID"