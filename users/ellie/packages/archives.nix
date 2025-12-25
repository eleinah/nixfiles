{ config, pkgs, ... }:

{
  packages = with pkgs; [
    zip
    unzip
    xz
    p7zip
  ];
}
