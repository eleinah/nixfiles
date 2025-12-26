{ config, pkgs, ... }:

{
  programs.doom-emacs = {
    enable = true;
    doomDir = ".doom.d";
  };
}
