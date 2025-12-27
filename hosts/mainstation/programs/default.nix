{ config, pkgs, ... }:

{
  imports = [
    ./dms.nix
    ./steam.nix
    ./niri.nix
  ];
}
