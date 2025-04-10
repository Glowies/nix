pkgs: {
  enable = true;
  userName = "glowies";
  userEmail = "comuokta@gmail.com";
  extraConfig = {
    init.defaultBranch = "main";
  };
  aliases = {
    a = "add";
    ci = "commit";
    ca = "commit --amend";
    can = "commit --amend --no-edit";
    cl = "clone";
    cm = "commit -m";
    co = "checkout";
    cp = "cherry-pick";
    cpx = "cherry-pick -x";
    d = "diff";
    f = "fetch";
    fo = "fetch origin";
    fu = "fetch upstream";
    lol = "log --graph --decorate --pretty=oneline --abbrev-commit";
    lola = "log --graph --decorate --pretty=oneline --abbrev-commit --all";
    pl = "pull";
    pr = "pull -r";
    ps = "push";
    psf = "push -f";
    rb = "rebase";
    rbi = "rebase -i";
    r = "remote";
    ra = "remote add";
    rr = "remote rm";
    rv = "remote -v";
    rs = "remote show";
    st = "status";
  };
}
