# Tmux CDLS

`tmux-cdls` displays your current directory's contents in a dedicated pane that automatically updates as you modify the directory or navigate. This keeps your file structure visible at all times, making file operations and navigation easier.

The plugin is inspired by [broot](https://dystroy.org/broot/), but with a much simpler approach and without taking you out of your usual terminal workflow.

Requirements: `tmux 1.9` or higher.

### Key bindings

- `prefix + e` - toggle directory listing pane (customizable)

### Installation with [Tmux Plugin Manager](https://github.com/tmux-plugins/tpm) (recommended)

Add plugin to the list of TPM plugins in `.tmux.conf`:

    set -g @plugin 'chris-paganon/tmux-cdls'

Hit `prefix + I` to fetch the plugin and source it. You should now be able to use the plugin.

### Manual Installation

Clone the repo:

    $ git clone https://github.com/chris-paganon/tmux-cdls ~/clone/path

Add this line to the bottom of `.tmux.conf`:

    run-shell ~/clone/path/cdls.tmux

Reload TMUX environment:

    # type this in terminal
    $ tmux source-file ~/.tmux.conf

You should now be able to use the plugin.

### Configuration

You can customize the plugin behavior by adding these options to your `.tmux.conf`:

    # Change the toggle key (default: e)
    set -g @cdls-toggle "d"

    # Change the pane size (default: 30%)
    set -g @cdls-size "40%"

    # Use a custom ls command (default: auto-detect exa/lsd/ls)
    set -g @cdls-command "ls -lah --color=always"

    # Change the polling rate in seconds (default: 0.5)
    set -g @cdls-poll-rate "1"

### Credits

This plugin is heavily based on [tmux-sidebar](https://github.com/tmux-plugins/tmux-sidebar) by [Bruno Sutic](https://github.com/bruno-). The toggle mechanism, key binding system, and overall architecture were adapted from his excellent plugin. Thank you!

### License

[MIT](LICENSE)
