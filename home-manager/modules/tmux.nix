{
    programs.tmux = {
        enable = true;
        extraConfig = ''
set -g @plugin 'tmux-plugins/tpm'
set -g @plugin 'tmux-plugins/tmux-sensible'
set -g @plugin 'catppuccin/tmux#v2.1.3'
set -g default-terminal "tmux-256color"
set -g @catppuccin_window_status_style "rounded"

unbind r
bind r source-file ~/.config/tmux/tmux.conf

set -g prefix C-s

set -g mouse on

bind-key h select-pane -L
bind-key l select-pane -R
bind-key k select-pane -U
bind-key j select-pane -D

set-option -g status-position top

set -g status-right-length 100
set -g status-left-length 100
set -g status-left ""
set -g status-right "#{E:@catppuccin_status_application}"
set -ag status-right "#{E:@catppuccin_status_session}"

set -g base-index 1

set-option -g status-style bg=default
set -g @catppuccin_status_background "default"

# Initialize TMUX plugin manager (keep this line at the very bottom of tmux.conf)
run '~/.tmux/plugins/tpm/tpm'
        '';
    };
}
