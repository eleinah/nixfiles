{ config, pkgs, ... }:

{
  imports = [
    ./audio
    ./boot
    ./network
    ./programs
    ./conf.nix
  ];
}
