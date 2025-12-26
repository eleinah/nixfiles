{ config, pkgs, ... }:


{
  programs.caelestia = {
    enable = true;
    systemd = {
      enable = false;
      target = "graphical-session.target";
      environment = [];
    };
    settings = {
      bar.status = {
        showBattery = true;
      };
      paths.wallpaperDir = "~/Pictures/Wallpapers";
    };
    cli = {
      enable = true;
      settings = {
        theme.enableGtk = false;
      };
    };
  };
}
