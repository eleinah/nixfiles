{ config, pkgs, ... }:

{
  imports = [
    ./audio
    ./boot
    ./network
    ./programs
    ./services
    ./conf.nix
  ];
}
