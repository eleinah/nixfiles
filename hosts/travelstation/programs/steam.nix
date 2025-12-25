{ config, pkgs, ... }:

{
  programs.steam = {
    enable = false;
    extraCompatPackages = [
      pkgs.proton-ge-bin
    ];
  };
}
