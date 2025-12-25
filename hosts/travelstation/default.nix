{ config, lib, pkgs, ... }:

{
  imports = [
    ./input
    ./network
    ./users
    ./hardware-configuration.nix
  ];
}
