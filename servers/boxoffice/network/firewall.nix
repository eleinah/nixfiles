{ config, pkgs, ... }:

{
  networking.firewall = {
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
}
