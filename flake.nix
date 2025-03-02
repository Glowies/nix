# SOURCES:
# https://nixcademy.com/posts/nix-on-macos/
# https://davi.sh/blog/2024/01/nix-darwin/
# https://github.com/jonringer/nixpkgs-config/tree/14626b49310d747a2a4d4c1e3fd62dedef4cb860
{
  description = "Example nix-darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    nix-vscode-extensions.url = "github:nix-community/nix-vscode-extensions";
    mac-app-util.url = "github:hraban/mac-app-util";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{
      self,
      nix-darwin,
      nixpkgs,
      home-manager,
      nix-vscode-extensions,
      mac-app-util,
    }:
    let
      username = "glowies";
      configuration =
        { pkgs, ... }:
        {
          # List packages installed in system profile. To search by name, run:
          # $ nix-env -qaP | grep wget
          environment.systemPackages = with pkgs; [
            obsidian
            git
            neovim
            nixfmt-rfc-style
            fzf
            jankyborders
            tmuxPlugins.catppuccin
          ];

          # Necessary for using flakes on this system.
          nix.settings.experimental-features = "nix-command flakes";

          # Set Git commit hash for darwin-version.
          system.configurationRevision = self.rev or self.dirtyRev or null;

          # Used for backwards compatibility, please read the changelog before changing.
          # $ darwin-rebuild changelog
          system.stateVersion = 6;

          # The platform the configuration will be used on.
          nixpkgs.hostPlatform = "aarch64-darwin";

          # Allow unfree packages
          nixpkgs.config.allowUnfree = true;

          # Add overlays to nixpkgs
          nixpkgs.overlays = [
            nix-vscode-extensions.overlays.default
          ];

          # Disable nix-darwins control over the nix installation so that Determinate Nix takes over
          nix.enable = false;

          # Add support for intel binaries
          nix.extraOptions = ''
            extra-platforms = x86_64-darwin aarch64-darwin
          '';

          # Enable Touch ID for sudo
          security.pam.enableSudoTouchIdAuth = true;
          # security.pam.services.sudo_local = {
          #   enable = true;
          #   reattach = true;
          #   touchIdAuth = true;
          #   watchIdAuth = true;
          # };

          # Set System Defaults
          system.defaults = {
            controlcenter.Bluetooth = true;
            NSGlobalDomain."com.apple.swipescrolldirection" = false;
            NSGlobalDomain.ApplePressAndHoldEnabled = false;
            NSGlobalDomain.NSScrollAnimationEnabled = false;
            #NSGlobalDomain."com.apple.mouse.linear" = true;
            #NSGlobalDomain."com.apple.scrollwheel.scaling" = 1;
            ".GlobalPreferences"."com.apple.mouse.scaling" = -1.0;
            finder.AppleShowAllExtensions = true;
            finder.AppleShowAllFiles = true;
            finder.FXPreferredViewStyle = "clmv";
            finder.NewWindowTarget = "Computer";
            finder.ShowPathbar = true;
            dock.orientation = "bottom";
            dock.autohide = true;
            dock.autohide-time-modifier = 0.1;
            dock.show-recents = false;
            dock.tilesize = 32;
            dock.wvous-tl-corner = 2;
            dock.wvous-tr-corner = 2;
            spaces.spans-displays = false;
            WindowManager.EnableStandardClickToShowDesktop = false;
          };

          # set users to avoid error with home-manager
          users = {
            users.${username} = {
              home = "/Users/${username}";
              name = "${username}";
            };
          };

          # import aerospace settings
          services.aerospace.enable = true;
          services.aerospace.settings = import ./aerospace.nix pkgs;

          # set up jankyborders
          launchd.user.agents.jankyborders = {
            serviceConfig = {
              ProgramArguments = [
                "${pkgs.jankyborders}/bin/borders"
                "style=round"
                "active_color=0xffe1e3e4"
                "inactive_color=0x00494d64"
                "width=8.0"
              ];
              KeepAlive = true;
              RunAtLoad = true;
              ProcessType = "Interactive";
            };
          };
        };
    in
    {
      # Build darwin flake using:
      # $ darwin-rebuild build --flake .#simple
      darwinConfigurations."glowies-mac-mini" = nix-darwin.lib.darwinSystem {
        modules = [
          configuration
          mac-app-util.darwinModules.default
          home-manager.darwinModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.verbose = true;
            home-manager.users.${username} = import ./home.nix;
            home-manager.backupFileExtension = "bkp";
            home-manager.sharedModules = [
              mac-app-util.homeManagerModules.default
            ];
          }
        ];
      };
    };
}
