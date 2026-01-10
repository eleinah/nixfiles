{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.programs.librepods;

  rawIcon = ./xdg-icons/librepods.png;

  iconPath = ".local/share/icons/librepods.png";

  appIcon = "${config.home.homeDirectory}/${iconPath}";
in
{
  options.programs.librepods = {
    enable = lib.mkEnableOption "LibrePods tray app";
    package = lib.mkOption {
      type = lib.types.package;
      default = pkgs.librepods;
      description = "LibrePods Linux package to use";
    };
    autostart = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Start LibrePods automatically in the user session";
    };
  };

  config = lib.mkIf cfg.enable {
    home.packages = [
      cfg.package
    ];

    home.file."${iconPath}".source = rawIcon;

    xdg.desktopEntries.librepods = {
      name = "LibrePods";
      exec = "librepods";
      terminal = false;
      icon = "${appIcon}";
      type = "Application";
      categories = [
        "AudioVideo"
        "Utility"
      ];
    };
  };
}
