pkgs: {
  enable = true;
  enableZshIntegration = true;
  extraConfig = ''
    local wezterm = require('wezterm')
    local config = wezterm.config_builder()

    config.default_prog = { "zsh", "--login", "-c", "tmux attach -t dev || tmux new -s dev" }
    config.window_decorations = "RESIZE"
    config.color_scheme = "Catppuccin Mocha"

    config.font = wezterm.font("FiraCode Nerd Font Mono")
    config.font_size = 16

    config.use_fancy_tab_bar = false
    config.show_new_tab_button_in_tab_bar = false
    config.tab_max_width = tab_max_width
    config.tab_bar_at_bottom = true
    config.hide_tab_bar_if_only_one_tab = true
    config.switch_to_last_active_tab_when_closing_tab = true

    config.max_fps = 240

    return config
  '';
}
