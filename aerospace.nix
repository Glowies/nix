pkgs: {
  # You can use it to add commands that run after AeroSpace startup.
  # 'after-startup-command' is run after 'after-login-command'
  # Available commands : https://nikitabobko.github.io/AeroSpace/commands
  after-startup-command = [ ];

  # Start AeroSpace at login
  start-at-login = false;

  # Normalizations. See: https://nikitabobko.github.io/AeroSpace/guide#normalization
  enable-normalization-flatten-containers = true;
  enable-normalization-opposite-orientation-for-nested-containers = true;

  # See: https://nikitabobko.github.io/AeroSpace/guide#layouts
  # The 'accordion-padding' specifies the size of accordion padding
  # You can set 0 to disable the padding feature
  accordion-padding = 30;

  # Possible values: tiles|accordion
  default-root-container-layout = "tiles";

  # Possible values: horizontal|vertical|auto
  # 'auto' means: wide monitor (anything wider than high) gets horizontal orientation,
  #               tall monitor (anything higher than wide) gets vertical orientation
  default-root-container-orientation = "auto";

  # Mouse follows focus when focused monitor changes
  # Drop it from your config, if you don't like this behavior
  # See https://nikitabobko.github.io/AeroSpace/guide#on-focus-changed-callbacks
  # See https://nikitabobko.github.io/AeroSpace/commands#move-mouse
  # Fallback value (if you omit the key): on-focused-monitor-changed = []
  on-focused-monitor-changed = [ "move-mouse monitor-lazy-center" ];

  # You can effectively turn off macOS "Hide application" (cmd-h) feature by toggling this flag
  # Useful if you don't use this macOS feature, but accidentally hit cmd-h or cmd-alt-h key
  # Also see: https://nikitabobko.github.io/AeroSpace/goodies#disable-hide-app
  automatically-unhide-macos-hidden-apps = false;

  # Possible values: (qwerty|dvorak)
  # See https://nikitabobko.github.io/AeroSpace/guide#key-mapping
  key-mapping.preset = "qwerty";

  # Gaps between windows (inner-*) and between monitor edges (outer-*).
  # Possible values:
  # - Constant:     gaps.outer.top = 8
  # - Per monitor:  gaps.outer.top = [{ monitor.main = 16 }, { monitor."some-pattern" = 32 }, 24]
  #                 In this example, 24 is a default value when there is no match.
  #                 Monitor pattern is the same as for 'workspace-to-monitor-force-assignment'.
  #                 See: https://nikitabobko.github.io/AeroSpace/guide#assign-workspaces-to-monitors
  gaps = {
    inner.horizontal = 16;
    inner.vertical = 16;
    outer.left = 8;
    outer.bottom = 8;
    outer.top = 8;
    outer.right = 8;
  };

  on-window-detected = [
    {
      "if" = {
        app-id = "com.apple.finder";
      };
      "run" = [
        "layout floating"
      ];
    }
    {
      "if" = {
        app-id = "com.brave.Browser";
      };
      "run" = [
        "layout tiling"
        "move-node-to-workspace W"
      ];
    }
    {
      "if" = {
        app-id = "org.blenderfoundation.blender";
      };
      "run" = [
        "move-node-to-workspace B"
      ];
    }
    {
      "if" = {
        app-id = "com.microsoft.VSCode";
      };
      "run" = [
        "move-node-to-workspace V"
      ];
    }
    {
      "if" = {
        app-id = "com.cisco.secureclient.gui";
      };
      "run" = [
        "layout floating"
      ];
    }
    {
      "if" = {
        window-title-regex-substring = "TOR-WKS";
      };
      "run" = [
        "move-node-to-workspace R"
      ];
    }
    {
      "if" = {
        app-name-regex-substring = "teams";
      };
      "run" = [
        "move-node-to-workspace T"
      ];
    }
    {
      "if" = {
        app-id = "md.obsidian";
      };
      "run" = [
        "move-node-to-workspace O"
      ];
    }
    {
      "if" = {
        app-id = "com.spotify.client";
      };
      "run" = [
        "move-node-to-workspace S"
      ];
    }
  ];

  # 'main' binding mode declaration
  # See: https://nikitabobko.github.io/AeroSpace/guide#binding-modes
  # 'main' binding mode must be always presented
  # Fallback value (if you omit the key): mode.main.binding = {}
  mode.main.binding = {
    # All possible keys:
    # - Letters.        a, b, c, ..., z
    # - Numbers.        0, 1, 2, ..., 9
    # - Keypad numbers. keypad0, keypad1, keypad2, ..., keypad9
    # - F-keys.         f1, f2, ..., f20
    # - Special keys.   minus, equal, period, comma, slash, backslash, quote, semicolon, backtick,
    #                   leftSquareBracket, rightSquareBracket, space, enter, esc, backspace, tab
    # - Keypad special. keypadClear, keypadDecimalMark, keypadDivide, keypadEnter, keypadEqual,
    #                   keypadMinus, keypadMultiply, keypadPlus
    # - Arrows.         left, down, up, right

    # All possible modifiers: cmd, alt, ctrl, shift

    # All possible commands: https://nikitabobko.github.io/AeroSpace/commands

    # See: https://nikitabobko.github.io/AeroSpace/commands#layout
    alt-slash = "layout tiles horizontal vertical";
    alt-comma = "layout accordion horizontal vertical";

    # See: https://nikitabobko.github.io/AeroSpace/commands#focus
    alt-h = "focus left";
    alt-j = "focus down";
    alt-k = "focus up";
    alt-l = "focus right";

    # See: https://nikitabobko.github.io/AeroSpace/commands#move
    alt-shift-h = "move left";
    alt-shift-j = "move down";
    alt-shift-k = "move up";
    alt-shift-l = "move right";

    # See: https://nikitabobko.github.io/AeroSpace/commands#resize
    alt-shift-minus = "resize smart -50";
    alt-shift-equal = "resize smart +50";

    # See: https://nikitabobko.github.io/AeroSpace/commands#workspace
    alt-1 = "workspace 1";
    alt-2 = "workspace 2";
    alt-3 = "workspace 3";
    alt-4 = "workspace 4";
    alt-5 = "workspace 5";
    alt-6 = "workspace 6";
    alt-7 = "workspace 7";
    alt-8 = "workspace 8";
    alt-9 = "workspace 9";
    alt-a = "workspace A";
    alt-b = "workspace B";
    alt-c = "workspace C";
    alt-d = "workspace D";
    alt-e = "workspace E";
    alt-f = "workspace F";
    alt-g = "workspace G";
    alt-i = "workspace I";
    alt-m = "workspace M";
    alt-n = "workspace N";
    alt-o = "workspace O";
    alt-p = "workspace P";
    alt-q = "workspace Q";
    alt-r = "workspace R";
    alt-s = "workspace S";
    alt-t = "workspace T";
    alt-u = "workspace U";
    alt-v = "workspace V";
    alt-w = "workspace W";
    alt-x = "workspace X";
    alt-y = "workspace Y";
    alt-z = "workspace Z";

    # See: https://nikitabobko.github.io/AeroSpace/commands#move-node-to-workspace
    alt-shift-1 = "move-node-to-workspace 1 --focus-follows-window";
    alt-shift-2 = "move-node-to-workspace 2 --focus-follows-window";
    alt-shift-3 = "move-node-to-workspace 3 --focus-follows-window";
    alt-shift-4 = "move-node-to-workspace 4 --focus-follows-window";
    alt-shift-5 = "move-node-to-workspace 5 --focus-follows-window";
    alt-shift-6 = "move-node-to-workspace 6 --focus-follows-window";
    alt-shift-7 = "move-node-to-workspace 7 --focus-follows-window";
    alt-shift-8 = "move-node-to-workspace 8 --focus-follows-window";
    alt-shift-9 = "move-node-to-workspace 9 --focus-follows-window";
    alt-shift-a = "move-node-to-workspace A --focus-follows-window";
    alt-shift-b = "move-node-to-workspace B --focus-follows-window";
    alt-shift-c = "move-node-to-workspace C --focus-follows-window";
    alt-shift-d = "move-node-to-workspace D --focus-follows-window";
    alt-shift-e = "move-node-to-workspace E --focus-follows-window";
    alt-shift-f = "move-node-to-workspace F --focus-follows-window";
    alt-shift-g = "move-node-to-workspace G --focus-follows-window";
    alt-shift-i = "move-node-to-workspace I --focus-follows-window";
    alt-shift-m = "move-node-to-workspace M --focus-follows-window";
    alt-shift-n = "move-node-to-workspace N --focus-follows-window";
    alt-shift-o = "move-node-to-workspace O --focus-follows-window";
    alt-shift-p = "move-node-to-workspace P --focus-follows-window";
    alt-shift-q = "move-node-to-workspace Q --focus-follows-window";
    alt-shift-r = "move-node-to-workspace R --focus-follows-window";
    alt-shift-s = "move-node-to-workspace S --focus-follows-window";
    alt-shift-t = "move-node-to-workspace T --focus-follows-window";
    alt-shift-u = "move-node-to-workspace U --focus-follows-window";
    alt-shift-v = "move-node-to-workspace V --focus-follows-window";
    alt-shift-w = "move-node-to-workspace W --focus-follows-window";
    alt-shift-x = "move-node-to-workspace X --focus-follows-window";
    alt-shift-y = "move-node-to-workspace Y --focus-follows-window";
    alt-shift-z = "move-node-to-workspace Z --focus-follows-window";

    # See: https://nikitabobko.github.io/AeroSpace/commands#workspace-back-and-forth
    alt-tab = "workspace-back-and-forth";
    # See: https://nikitabobko.github.io/AeroSpace/commands#move-workspace-to-monitor
    alt-shift-tab = "move-workspace-to-monitor --wrap-around next";

    # See: https://nikitabobko.github.io/AeroSpace/commands#mode
    alt-shift-semicolon = "mode service";
  };

  # 'service' binding mode declaration.
  # See: https://nikitabobko.github.io/AeroSpace/guide#binding-modes
  mode.service.binding = {
    esc = [
      "reload-config"
      "mode main"
    ];
    r = [
      "flatten-workspace-tree"
      "mode main"
    ]; # reset layout
    f = [
      "layout floating tiling"
      "mode main"
    ]; # Toggle between floating and tiling layout
    backspace = [
      "close-all-windows-but-current"
      "mode main"
    ];

    # sticky is not yet supported https://github.com/nikitabobko/AeroSpace/issues/2
    #s = ['layout sticky tiling', 'mode main']

    alt-shift-h = [
      "join-with left"
      "mode main"
    ];
    alt-shift-j = [
      "join-with down"
      "mode main"
    ];
    alt-shift-k = [
      "join-with up"
      "mode main"
    ];
    alt-shift-l = [
      "join-with right"
      "mode main"
    ];

    down = "volume down";
    up = "volume up";
    shift-down = [
      "volume set 0"
      "mode main"
    ];
  };
}
