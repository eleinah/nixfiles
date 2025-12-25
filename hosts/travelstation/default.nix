{ config, lib, pkgs, ... }:

{
  imports = [
    ./input
    ./network
    ./hardware-configuration.nix
  ];
}
