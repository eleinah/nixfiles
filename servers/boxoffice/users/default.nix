{ config, pkgs, ... }:

{
  imports = [
    ./groups
    ./ticketmaster.nix
    ./media.nix
    ./qbittorrent.nix
    ./unpackerr.nix
  ];
}
