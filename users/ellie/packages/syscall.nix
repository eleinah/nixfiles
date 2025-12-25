{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    strace
    ltrace
    lsof
  ];
}
