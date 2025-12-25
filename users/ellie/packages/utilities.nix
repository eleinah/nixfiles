{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    ripgrep
    jq
    fzf
    fd
    wget
    bottom
    dysk
    lsd
    freerdp
    viu
    vhs
    wl-clipboard
    xarchiver
  ];
}
