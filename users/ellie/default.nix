{ config, pkgs, ... }:

{
  imports = [
    ./sys.nix
    ./settings.nix
    ./files
    ./packages
    ./programs
  ];
}
