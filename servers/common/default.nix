{ config, pkgs, ... }:

{
  imports = [
    ./boot
    ./network
    ./conf.nix
  ];
}
