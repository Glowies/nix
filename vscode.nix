pkgs: {
  enable = true;
  userSettings = {
    # This property will be used to generate settings.json:
    # https://code.visualstudio.com/docs/getstarted/settings#_settingsjson
    "editor.formatOnSave" = true;
    "workbench.colorTheme" = "GitHub Dark Default";
    "vim.leader" = "<space>";
    "vim.easymotion" = true;
    "vim.useSystemClipboard" = true;
    "editor.lineNumbers" = "relative";
    "editor.minimap.enabled" = false;
    "zenMode.fullScreen" = false;
    "zenMode.hideLineNumbers" = false;
    "zenMode.showTabs" = "none";
    "zenMode.restore" = true;
    "zenMode.hideStatusBar" = false;
    "zenMode.centerLayout" = false;
    "editor.fontSize" = 14;
    "extensions.autoCheckUpdates" = false;
    "extensions.autoUpdate" = false;
    "extensions.experimental.affinity" = {
      "asvetliakov.vscode-neovim" = 1;
    };
  };
  extensions = with pkgs.vscode-marketplace; [
    jnoortheen.nix-ide
    jacqueslucke.blender-development
    github.github-vscode-theme
    ms-python.python
    ms-dotnettools.csharp
    charliermarsh.ruff
    tamasfe.even-better-toml
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
