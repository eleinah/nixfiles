{
  config,
  lib,
  pkgs,
  ...
}:

{
  services.jellyfin = {
    enable = true;
    openFirewall = false;
    user = "media";
    group = "media";
    dataDir = "/var/lib/jellyfin";
    cacheDir = "/var/cache/jellyfin";
  };

  services.jellyseerr = {
    enable = true;
    openFirewall = false;
    user = "media";
    group = "media";
    dataDir = "/var/lib/jellyseerr";
  };
}
