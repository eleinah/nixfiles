{
  config,
  lib,
  pkgs,
  ...
}:

{
  users.users.qbittorrent = {
    isSystemUser = true;
    home = "/var/lib/qbittorrent";
    group = "download";
  };
}
