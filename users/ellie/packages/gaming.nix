{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    prismlauncher
    xivlauncher
    protontricks
  ];
}
