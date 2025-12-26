{ config, pkgs, ... }:

{
  programs.doom-emacs = {
    enable = true;
    doomDir = "$HOME/.doom.d";
  };
}
