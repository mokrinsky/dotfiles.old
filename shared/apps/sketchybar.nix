{
  config,
  lib,
  pkgs,
  ...
}: let
  inherit (pkgs.stdenv.hostPlatform) isDarwin;
  sketchybarPkg = pkgs.sketchybar;
in {
  home = lib.mkIf isDarwin {
    packages = [sketchybarPkg];
  };
  launchd = lib.mkIf isDarwin {
    agents.sketchybar = {
      enable = true;
      config = {
        ProgramArguments = ["${lib.getExe sketchybarPkg}"];
        KeepAlive = true;
        RunAtLoad = true;
        ProcessType = "Interactive";
        Nice = -20;
        StandardErrorPath = "${config.xdg.cacheHome}/sketchybar.log";
        StandardOutPath = "${config.xdg.cacheHome}/sketchybar.log";
        EnvironmentVariables = {
          LANG = "en_US.UTF-8";
          PATH = "${lib.makeBinPath [
            sketchybarPkg
            pkgs.bash
            pkgs.coreutils
            pkgs.yabai
            pkgs.jq
            pkgs.wireguard-tools
          ]}:/usr/bin:/usr/sbin";
        };
      };
    };
  };
  xdg.configFile = lib.mkIf isDarwin {
    "sketchybar" = {
      source = ./configs/sketchybar_config;
    };
  };
}
