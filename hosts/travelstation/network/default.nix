{ config, pkgs, ... }:

{
  imports = [
    ./networkmanager.nix
    ./sys.nix
  ];
}
