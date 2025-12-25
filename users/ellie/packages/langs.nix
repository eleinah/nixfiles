{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    d2
    shellcheck
  ];
}
