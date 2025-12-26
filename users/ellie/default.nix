{ config, pkgs, ... }:

{
  imports = [
    ./settings.nix
    ./path.nix
    ./home
    ./packages
    ./programs
  ];
}
