pkgs: {
  enable = true;
  userSettings = {
    # This property will be used to generate settings.json:
    # https://code.visualstudio.com/docs/getstarted/settings#_settingsjson
    "editor.formatOnSave" = true;
    "workbench.colorTheme" = "GitHub Dark Default";
  };
  extensions = with pkgs.vscode-marketplace; [
    jnoortheen.nix-ide
    jacqueslucke.blender-development
    github.github-vscode-theme
    vscodevim.vim
    ms-python.python
    ms-dotnettools.csharp
    charliermarsh.ruff
  ];
  keybindings = [
    # See https://code.visualstudio.com/docs/getstarted/keybindings#_advanced-customization
    {
      key = "shift+cmd+j";
      command = "workbench.action.focusActiveEditorGroup";
      when = "terminalFocus";
    }
  ];
}
