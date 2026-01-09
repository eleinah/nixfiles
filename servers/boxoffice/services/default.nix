{
  config,
  lib,
  pkgs,
  ...
}:

{
  imports = [
    ./systemd
  ];

  services = {
    jellyfin = {
      enable = true;
      openFirewall = false;
      user = "media";
      group = "media";
      dataDir = "/var/lib/jellyfin";
      cacheDir = "/var/cache/jellyfin";
    };

    jellyseerr = {
      enable = false;
    };

    qemuGuest = {
      enable = true;
    };

    radarr = {
      enable = true;
      openFirewall = false;
      dataDir = "/var/lib/radarr";
    };

    sonarr = {
      enable = true;
      openFirewall = false;
      dataDir = "/var/lib/sonarr";
    };

    prowlarr = {
      enable = true;
      openFirewall = false;
      dataDir = "/var/lib/prowlarr";
    };
  };
}
