#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
SCRIPTS_DIR="$CURRENT_DIR/scripts"

source "$SCRIPTS_DIR/helpers.sh"
source "$SCRIPTS_DIR/variables.sh"

set_default_key_binding_options() {
	local cdls_key="$(cdls_key)"
	set_tmux_option "${VAR_KEY_PREFIX}-${cdls_key}" ""
}

set_key_bindings() {
	local stored_key_vars="$(stored_key_vars)"
	local key
	local value
	for option in $stored_key_vars; do
		key="$(get_key_from_option_name "$option")"
		value="$(get_value_from_option_name "$option")"
		tmux bind-key "$key" run-shell "$SCRIPTS_DIR/toggle.sh '#{pane_id}'"
	done
}

main() {
	set_default_key_binding_options
	set_key_bindings
}
main