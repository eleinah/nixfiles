{ config, pkgs, ... }:

{
  networking.networkmanager = {
    enable = true;

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
}
