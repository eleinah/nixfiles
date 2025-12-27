{ config, pkgs, ... }:

{
  imports = [
    ./dms.nix
    ./niri.nix
  ];
}
