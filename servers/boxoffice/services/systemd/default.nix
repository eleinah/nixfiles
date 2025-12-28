{
  config,
  lib,
  pkgs,
  ...
}:

{
  imports = [
    ./qbittorrent.nix
    ./unpackerr.nix
    ./jellyseerr.nix
    ./wizarr.nix
  ];
}
