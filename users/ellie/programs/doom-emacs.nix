{ config, pkgs, ... }:

{
  programs.doom-emacs = {
    enable = true;
    doomDir = "../home/dots/.doom.d";
  };
}
