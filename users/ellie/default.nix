{ config, pkgs, ... }:

{
  imports = [
    ./settings.nix
    ./files
    ./packages
    ./programs
  ];
}
