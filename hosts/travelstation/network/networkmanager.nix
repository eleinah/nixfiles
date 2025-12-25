{ config, pkgs, ... }:

{
  networking.networkmanager = {

    ensureProfiles.profiles = {
      "Home WiFi" = {
        connection = {
          id = "Three Musketeers :3";
          type = "802-11-wireless";
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
