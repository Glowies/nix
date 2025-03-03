pkgs: {
  enable = true;
  shell = "${pkgs.zsh}/bin/zsh";
  keyMode = "vi";
  sensibleOnTop = true;
  baseIndex = 1;
  plugins = [
    {
      plugin = pkgs.tmuxPlugins.catppuccin;
      extraConfig = ''
        set -g @catppuccin_flavor 'mocha'
        set -g @catppuccin_window_status_style "rounded"
      '';
    }
  ];
  extraConfig = ''
    set -g renumber-windows on
    set -g default-command ${pkgs.zsh}/bin/zsh
    set -g mouse on
    set -g default-terminal "tmux-256color"

    # vim-like bindings
    bind s split-window -v -c "#{pane_current_path}"
    bind v split-window -h -c "#{pane_current_path}"
    bind '"' choose-window
    bind h select-pane -L
    bind j select-pane -D
    bind k select-pane -U
    bind l select-pane -R
  '';
}
