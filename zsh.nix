pkgs: {
  enable = true;
  package = pkgs.zsh;
  enableCompletion = true;
  autosuggestion = {
    enable = true;
  };
  oh-my-zsh = {
    enable = true;
    theme = "juanghurtado";
  };
  shellAliases = {
    switch = "darwin-rebuild switch --flake ~/.config/nix";
    vi = "nvim";
  };
}
