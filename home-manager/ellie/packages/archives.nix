{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    zip
    unzip
    xz
    p7zip
  ];
}
