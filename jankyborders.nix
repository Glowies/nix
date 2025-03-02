# SOURCE: https://git.kempkens.io/daniel/dotfiles/src/commit/335f91a670ea80c169970ee6a33a01de0f37ad39/system/darwin/jankyborders.nix
{ pkgs, config, ... }:

let
  pkg = pkgs.jankyborders;

  borders-config = [
    "style=round"
    "active_color=0xffbd93f9"
    "inactive_color=0xffabb2bf"
    "width=7.0"
    "hidpi=on"
    "ax_focus=on"
    "blacklist='Dropover,LaunchBar'"
  ];
in
{
  environment.systemPackages = [ pkg ];

  launchd.user.agents.jankyborders = {
    serviceConfig = {
      ProgramArguments = [ "${pkg}/bin/borders" ] ++ borders-config;

      KeepAlive = true;
      RunAtLoad = true;
      ProcessType = "Interactive";
      EnvironmentVariables = {
        PATH = "${pkg}/bin:${config.environment.systemPath}";
        LANG = "en_US.UTF-8";
      };
    };
  };
}
