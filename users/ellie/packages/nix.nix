{ config, pkgs, ... }:

{
  packages = with pkgs; [
    nix-output-monitor
  ];
}
