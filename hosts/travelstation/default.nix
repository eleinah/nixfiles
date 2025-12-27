{
  config,
  lib,
  pkgs,
  ...
}:

{
  imports = [
    ./input
    ./network
    ./programs
    ./hardware
    ./hardware-configuration.nix
    ./services
  ];
}
