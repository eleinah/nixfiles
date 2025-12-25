{ config, lib, pkgs, ... }:

{
  imports = [
    ./input
    ./network
    ./packages
    ./hardware-configuration.nix
  ];
}
