{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.programs.hytale;

  hytaleBundle = pkgs.fetchurl {
    url = "https://launcher.hytale.com/builds/release/linux/amd64/hytale-launcher-latest.flatpak";
    sha256 = "sha256-khOf7xjQCiWWPpSoSXU9s8G5IqDbacEBuKqZldqBq2c=";
  };

  hytaleId = "com.hypixel.HytaleLauncher";

  rawIcon = ./xdg-icons/hytale.png;

  iconPath = ".local/share/icons/hytale.png";

  appIcon = "${config.home.homeDirectory}/${iconPath}";
in
{
  options.programs.hytale = {
    enable = lib.mkEnableOption "Hytale Launcher";
  };

  config = lib.mkIf cfg.enable {
    home.packages = [ pkgs.flatpak ];
    home.activation.installHytale = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
      if ! ${pkgs.flatpak}/bin/flatpak list --user --app | grep -q "${hytaleId}"; then
        ${pkgs.flatpak}/bin/flatpak install --user --noninteractive --assumeyes "${hytaleBundle}"
      fi
    '';

    home.file."${iconPath}".source = rawIcon;

    xdg.desktopEntries.hytale = {
      name = "Hytale Launcher";
      exec = "flatpak run com.hypixel.HytaleLauncher";
      terminal = false;
      icon = "${appIcon}";
      type = "Application";
      categories = [
        "Game"
      ];
    };
  };
}
