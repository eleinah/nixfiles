{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.programs.helium-browser;
in
{
  options.programs.helium-browser = {
    enable = lib.mkEnableOption "Helium Browser";
    package = lib.mkOption {
      type = lib.types.package;
      default = pkgs.helium-browser;
      description = "Helium Browser Linux package to use";
    };
  };

  config = lib.mkIf cfg.enable {
    home.packages = [
      cfg.package
    ];

    xdg.desktopEntries.helium-browser = {
      name = "Helium Browser";
      exec = "helium-browser";
      terminal = false;
      type = "Application";
      categories = [
        "WebBrowser"
      ];
    };
  };
}
