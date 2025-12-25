{ config, pkgs, ... }:

{
  packages = with pkgs; [
    kew
  ];
}
