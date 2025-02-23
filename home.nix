{ config, pkgs, ... }:

let
    nvimsettings = import ./nvim.nix;
    gitsettings = import ./git.nix;
    zshsettings = import ./zsh.nix;
    vscodesettings = import ./vscode.nix;
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

  home.packages = with pkgs; [];

    home.sessionVariables = {
        EDITOR = "nvim";
    };

    # Program Configs
    programs.neovim = nvimsettings pkgs; 
    programs.git = gitsettings pkgs;
    programs.zsh = zshsettings pkgs;
    programs.vscode = vscodesettings pkgs;
}
