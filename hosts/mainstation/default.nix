{ config, lib, pkgs, ... }:

{
  imports = [
    ./network
    ./programs
    ./users
    ./hardware-configuration.nix
  ];
}
