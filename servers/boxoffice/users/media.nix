{
  config,
  lib,
  pkgs,
  ...
}:

{
  users.users.media = {
    isSystemUser = true;
    home = "/var/lib/media";
    group = "media";
    extraGroups = [
      "download"
    ];
  };
}
