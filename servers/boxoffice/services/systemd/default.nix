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
    ./wizarr.nix
  ];
}
