{ config, lib, pkgs, ... }:

{
  imports = [
    ./network
    ./programs
    #./hardware-configuration.nix
  ];
}
