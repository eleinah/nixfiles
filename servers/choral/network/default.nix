{
  config,
  lib,
  pkgs,
  ...
}:

{
  networking = {
    hostName = "choral";

    firewall = {
      allowedTCPPorts = [
        8384 # Syncthing
        22000 # Syncthing transfers
        5030 # slskd http
        5031 # slskd https
        50300 # slskd incoming
      ];
      allowedUDPPorts = [
        22000 # Syncthing transfers
        21027 # Syncthing discovery
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
