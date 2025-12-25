{ config, pkgs, ... }:

{
  imports = [
    ../../../common/network
    ./networkmanager.nix
    ./sys.nix
  ];
}
