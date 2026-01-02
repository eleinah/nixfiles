{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    strace
    lsof
  ];
}
