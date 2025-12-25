{ config, pkgs, ... }:

{
  packages = with pkgs; [
    strace
    ltrace
    lsof
  ];
}
