{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.programs.helium-browser;

  rawIcon = pkgs.fetchurl {
    url = "https://github.com/imputnet/helium/blob/main/resources/branding/app_icon/raw.png";
    sha256 = "sha256-OjPOH/uUSVbNC12lEPyBi/yxTrjTkCQJMg45x/uoIGs=";
  };

  iconPath = ".local/share/icons/helium-browser.png";

  appIcon = "${config.home.homeDirectory}/${iconPath}";
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

    home.file."${iconPath}".source = rawIcon;

    xdg.desktopEntries.helium-browser = {
      name = "Helium Browser";
      exec = "helium-browser";
      terminal = false;
      icon = "${appIcon}";
      type = "Application";
      categories = [
        "WebBrowser"
      ];
    };
  };
}
