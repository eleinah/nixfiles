{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./network
    ./users
    ./services
    ./tmpfiles.nix
  ];
}
