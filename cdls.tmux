#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

tmux bind-key d run-shell "$CURRENT_DIR/scripts/starter.sh"
tmux bind-key D run-shell "$CURRENT_DIR/scripts/stopper.sh"