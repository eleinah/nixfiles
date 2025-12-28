{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    gamescope
    prismlauncher
    xivlauncher
  ];
}
