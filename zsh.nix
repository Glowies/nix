pkgs: {
  enable = true;
  shellAliases = {
    switch = "darwin-rebuild switch --flake ~/.config/nix";
    vi = "nvim";
  };
}
