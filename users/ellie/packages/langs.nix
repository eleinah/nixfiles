{ config, pkgs, ... }:

{
  packages = with pkgs; [
    d2
    shellcheck
  ];
}
