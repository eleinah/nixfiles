{
  config,
  lib,
  pkgs,
  ...
}:

{
  systemd.tmpfiles.rules = [
    "d /data 0755 root root -"
    "d /data/music 0770 music music -"
    "d /var/lib/syncthing 0750 syncthing download -"
    "d /var/lib/syncthing/db 0750 syncthing download -"
    "d /var/lib/syncthing/config 0750 syncthing download -"
    "d /var/lib/slskd 0750 soul download -"
  ];
}
