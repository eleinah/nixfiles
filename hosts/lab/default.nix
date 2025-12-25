{ config, lib, pkgs, ... }:

{
  imports = [
    ./boot
    ./hardware-configuration.nix
    ./network
    ./users
    ./input
    ./audio
    ./programs
  ];
}
