{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    noto-fonts
    noto-fonts-color-emoji
    noto-fonts-emoji-blob-bin
    noto-fonts-cjk-sans
    font-awesome
  ];
}
