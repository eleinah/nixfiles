{ config, pkgs, ... }:

{
  imports = [
    ./settings.nix
    ./home
    ./packages
    ./programs
  ];
}
