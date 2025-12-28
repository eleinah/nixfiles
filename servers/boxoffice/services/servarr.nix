{
  config,
  lib,
  pkgs,
  ...
}:

{
  services.radarr = {
    enable = true;
    openFirewall = false;
    dataDir = "/var/lib/radarr";
  };

  services.sonarr = {
    enable = true;
    openFirewall = false;
    dataDir = "/var/lib/sonarr";
  };

  services.prowlarr = {
    enable = true;
    openFirewall = false;
    dataDir = "/var/lib/prowlarr";
  };
}
