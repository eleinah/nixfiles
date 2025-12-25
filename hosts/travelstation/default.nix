{ config, lib, pkgs, ... }:

{
  imports = [
    ./input
    ./network
    ./programs
    ./hardware-configuration.nix
  ];
}
