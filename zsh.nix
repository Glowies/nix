pkgs: {
  enable = true;
  enableCompletion = true;
  autosuggestion = {
    enable = true;
  };
  oh-my-zsh = {
    enable = true;
    theme = "Soliah";
  };
  shellAliases = {
    switch = "darwin-rebuild switch --flake ~/.config/nix";
    vi = "nvim";
  };
}
