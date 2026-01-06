# Tmux CDLS

`tmux-cdls` keeps a live directory listing at the top of your terminal that updates automatically as you navigate. It helps you stay aware of your current directory contents while you work.

The plugin is inspired by [broot](https://dystroy.org/broot/), but with a much simpler approach and without taking you out of your terminal.

Some of the features that make the plugin useful:

- **always visible**<br/>
  Directory listing stays at the top of your terminal, auto-updating as you cd around.
- **unobtrusive**<br/>
  Takes up minimal space (default 30% of screen) and doesn't interfere with your workflow.
- **smart command detection**<br/>
  Automatically uses `exa` or `lsd` if available, falls back to `ls` otherwise.

Requirements: `tmux 1.9` or higher

Tested on Linux.

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
