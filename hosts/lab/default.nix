{ config, lib, pkgs, ... }:

{
  imports = [
    ./network
    ./hardware-configuration.nix
  ];
}
