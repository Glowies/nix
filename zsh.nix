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
    lg = "lazygit";
  };
  initExtra = ''
    function y() {
      local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
      yazi "$@" --cwd-file="$tmp"
      if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
        builtin cd -- "$cwd"
      fi
      rm -f -- "$tmp"
    }
    eval "$(/opt/homebrew/bin/brew shellenv)"
  '';
}
