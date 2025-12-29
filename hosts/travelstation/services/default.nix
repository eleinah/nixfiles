{ config, pkgs, ... }:

{
  imports = [
    ./battery.nix
    ./blueman.nix
  ];
}
