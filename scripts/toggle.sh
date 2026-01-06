#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source "$CURRENT_DIR/helpers.sh"
source "$CURRENT_DIR/variables.sh"

# script global vars
PANE_ID="$1"
PANE_CURRENT_PATH="$(get_pane_info "$PANE_ID" "#{pane_current_path}")"

supported_tmux_version_ok() {
	$CURRENT_DIR/check_tmux_version.sh "$SUPPORTED_TMUX_VERSION"
}

cdls_registration() {
	get_tmux_option "${REGISTERED_PANE_PREFIX}-${PANE_ID}" ""
}

cdls_pane_id() {
	cdls_registration |
		cut -d',' -f1
}

register_cdls() {
	local cdls_id="$1"
	set_tmux_option "${REGISTERED_CDLS_PREFIX}-${cdls_id}" "$PANE_ID"
	set_tmux_option "${REGISTERED_PANE_PREFIX}-${PANE_ID}" "${cdls_id}"
}

cdls_exists() {
	local pane_id="$(cdls_pane_id)"
	tmux list-panes -F "#{pane_id}" 2>/dev/null |
		\grep -q "^${pane_id}$"
}

has_cdls() {
	if [ -n "$(cdls_registration)" ] && cdls_exists; then
		return 0
	else
		return 1
	fi
}

kill_cdls() {
	local cdls_pane_id="$(cdls_pane_id)"
	tmux kill-pane -t "$cdls_pane_id"
}

create_cdls() {
	local cdls_id="$(tmux split-window -b -l 30% -P -F "#{pane_id}" "$CURRENT_DIR/runner.sh $PANE_ID")"
	register_cdls "$cdls_id"
	# Return focus to the original pane
	tmux select-pane -t "$PANE_ID"
}

current_pane_is_cdls() {
	local var="$(get_tmux_option "${REGISTERED_CDLS_PREFIX}-${PANE_ID}" "")"
	[ -n "$var" ]
}

execute_command_from_main_pane() {
	# get pane_id for this cdls
	local main_pane_id="$(get_tmux_option "${REGISTERED_CDLS_PREFIX}-${PANE_ID}" "")"
	# execute the same command as if from the "main" pane
	$CURRENT_DIR/toggle.sh "$main_pane_id"
}

toggle_cdls() {
	if has_cdls; then
		kill_cdls
	else
		create_cdls
	fi
}

main() {
	if supported_tmux_version_ok; then
		if current_pane_is_cdls; then
			execute_command_from_main_pane
		else
			toggle_cdls
		fi
	fi
}
main
