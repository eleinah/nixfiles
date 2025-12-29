{
  config,
  lib,
  pkgs,
  ...
}:

{
  imports = [
    ./battery.nix
    ./udev.nix
  ];
}
