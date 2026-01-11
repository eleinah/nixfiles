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
    slskd = {
      enable = true;
      openFirewall = false;
      user = "soul";
      group = "download";
    };

    syncthing = {
      enable = true;
      openDefaultPorts = false;
      user = "syncthing";
      group = "download";
      dataDir = "/var/lib/syncthing";
      databaseDir = "/var/lib/syncthing/db";
      configDir = "/var/lib/syncthing/config";
      guiAddress = "0.0.0.0:8384";
    };

    qemuGuest = {
      enable = true;
    };
  };
}
