#!/usr/bin/env bash

set -e

last_path=""
current_path=""
pane_id="$1"

if [[ -z $TMUX ]]; then
  echo "this script only runs inside tmux"
  exit 1
fi

ls_command() {
  if command -v exa >/dev/null 2>&1; then
    exa -a --color=always "$1"
  elif command -v lsd >/dev/null 2>&1; then
    lsd -A --color=always "$1"
  else
    ls -A --color=always "$1"
  fi
}

print_new_directory_content() {
  current_path=$(tmux display-message -p -t "$pane_id" '#{pane_current_path}')

  if [[ "$current_path" != "$last_path" ]]; then
    echo "$current_path"
    ls_command "$current_path"
    echo ""
    
    last_path="$current_path"
  fi
}

background_runner() {
  while true; do
    print_new_directory_content
    sleep 0.5
  done
}

background_runner