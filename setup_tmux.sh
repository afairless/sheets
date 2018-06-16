#!/bin/bash

# Andrew Fairless, June 2016
# This script configures Tmux
# WARNING:  This script will overwrite any existing '.tmux.conf' file


cat <<EOF > ~/.tmux.conf

# Remaps prefix key from Ctrl-b to Ctrl-a
set -g prefix C-a
unbind C-b
bind C-a send-prefix

# Remaps prefix key from Ctrl-b to  (back-tick key)
#unbind C-b
#set -g prefix (replace with back-tick)
#bind (replace with back-tick) send-prefix

# Sets key actions to be like Vi (replace 'vi' with 'emacs' for Emacs key actions)
#set -g status-keys vi
setw -g mode-keys vi 

# switch panes using Alt-key without prefix; uses same keys as in Vim
bind -n M-h select-pane -L
bind -n M-l select-pane -R
bind -n M-k select-pane -U
bind -n M-j select-pane -D

# Enable mouse control (clickable windows, panes, resizable panes)
set -g mouse-select-window on
set -g mouse-select-pane on
set -g mouse-resize-pane on
# Enable mouse mode (tmux 2.1 and above)
#set -g mouse on

# Changes pane border colors to make active pane easier to see
set-option -g pane-border-fg blue
set-option -g pane-active-border-fg brightyellow
set-option -g pane-active-border-bg default 

# Allows efficient copying from one pane and pasting to the pane to its right
# With vim mode enabled for Tmux copy mode, M-Space Space starts copy text selection at cursor
bind -n M-Space copy-mode
# With vim mode enabled for Tmux copy mode, Enter M-Enter ends copy text selection at cursor and pastes it into pane to the right
bind -n M-Enter select-pane -R \; paste-buffer

EOF

