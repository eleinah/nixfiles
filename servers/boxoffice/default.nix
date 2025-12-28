{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./packages
    ./programs
    ./users
    ./users/groups
  ];
}
