{ config, pkgs, ... }:

let
  gitsettings = import ./git.nix;
  zshsettings = import ./zsh.nix;
in
{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "glowies";
  #home.homeDirectory = /Users/glowies;

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "24.11";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  home.packages = with pkgs; [ ];

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  # dotfile symlinks
  home.file = {
    ".vimrc".source = ./dotfiles/.vimrc;
    ".wezterm.lua".source = ./dotfiles/.wezterm.lua;
    ".config/nvim/" = {
      source = ./dotfiles/nvim;
      recursive = true;
    };
    ".config/yazi/" = {
      source = ./dotfiles/yazi;
      recursive = true;
    };
    ".config/tmux/" = {
      source = ./dotfiles/tmux;
      recursive = true;
    };
  };

  # Program Configs
  programs.git = gitsettings pkgs;
  programs.zsh = zshsettings pkgs;
  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
  };
}
