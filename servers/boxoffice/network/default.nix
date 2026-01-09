{
  config,
  lib,
  pkgs,
  ...
}:

{
  networking = {
    hostname = "boxoffice";

    firewall = {
      allowedTCPPorts = [
        8096 # Jellyfin
        8097 # Jellyseerr
        8080 # qBittorrent web ui
        27421 # qBittorrent listen
        7878 # Radarr
        8989 # Sonarr
        9696 # Prowlarr
        5656 # Unpackerr
      ];
    };

    networkmanager = {
      ensureProfiles.profiles = {
        "Wired connection 1" = {
          connection = {
            id = "Wired connection 1";
            type = "802-3-ethernet";
          };
          ipv4 = {
            method = "auto";
            dns = "10.4.10.5";
            dns-search = "lly.local";
          };
        };
      };
    };
  };
}
