{ config, pkgs, ... }:

{
  packages = with pkgs; [
    file
    which
    tree
    gnupg
    gawk
  ];
}
