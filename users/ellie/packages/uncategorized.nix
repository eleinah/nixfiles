{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    fastfetch
    nnn # terminal file manager
    vlc
    zsh-autocomplete
  ];
}
