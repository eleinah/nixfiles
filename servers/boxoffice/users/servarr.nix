{
  config,
  lib,
  pkgs,
  ...
}:

{
  users.users = {
    radarr.extraGroups = [
      "media"
      "download"
    ];
    sonarr.extraGroups = [
      "media"
      "download"
    ];
  };
}
