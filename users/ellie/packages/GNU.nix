{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    file
    which
    tree
    gnupg
    gawk
  ];
}
