{ config, pkgs, ... }:

{
  imports = [
    ./files.nix
    ./settings.nix
    ./packages
    ./programs
    ./services
  ];
}
