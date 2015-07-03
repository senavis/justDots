# Smart pane switching with awareness of vim splits
is_vim='echo "#{pane_current_command}" | grep -iqE "(^|\/)g?(view|n?vim?)(diff)?$"'
bind -n C-h if-shell "$is_vim" "send-keys C-h" "select-pane -L"
bind -n C-j if-shell "$is_vim" "send-keys C-j" "select-pane -D"
bind -n C-k if-shell "$is_vim" "send-keys C-k" "select-pane -U"
bind -n C-l if-shell "$is_vim" "send-keys C-l" "select-pane -R"
bind -n C-\ if-shell "$is_vim" "send-keys C-\\" "select-pane -l"

# for new windows and panes from current directory
bind c new-window -c "#{pane_current_path}"
bind % split-window -h -c "#{pane_current_path}"
bind '"' split-window -c "#{pane_current_path}"

# set -g default-command /usr/local/bin/zsh
set -g default-shell /usr/local/bin/zsh
set -g default-terminal "screen-256color"
set -g status-style bg=black
#set -g status-fg white

# Reload config with a kej
bind-key r source-file ~/.tmux.conf \; display "Config reloaded!"

# Cycle panes with C-b C-b
unbind ^B
bind ^B select-pane -t :.+

# Start numbering at 1
set -g base-index 1

# Mouse on
set -g mode-mouse on

# List of plugins
#
# # Supports `github_username/repo` or full git repo URL

set -g @tpm_plugins '              \
  tmux-plugins/tpm                 \
  tmux-plugins/tmux-sensible       \
  tmux-plugins/tmux-resurrect      \
  tmux-plugins/tmux-continuum      \
'

# Other examples:
# # github_username/plugin_name    \
# # git@github.com/user/plugin     \
# # git@bitbucket.com/user/plugin  \
#
# # Initializes TMUX plugin manager.

# for vim and other programs
set -g @resurrect-strategy-vim 'session'
set -g @resurrect-processes 'ssh psql mysql sqlite3'
set -g @resurrect-processes 'irb pry "~rails server" "~rails console" "git log"'

# Automatic start and save by continuum
set -g @continuum-boot 'off'
set -g @continuum-boot-options 'iterm'
#set -g @continuum-boot-options 'iterm,fullscreen'
set -g @continuum-restore 'off'
set -g @continuum-save-interval '60'

# # Keep this line at the very bottom of tmux.conf.
run-shell '~/.tmux/plugins/tpm/tpm'
