{ config, lib, pkgs, ... }:

{
  imports = [
    ./network
    ./users
    ./hardware-configuration.nix
  ];
}
