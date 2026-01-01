{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    bat
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
    ispell
    aspell
    keymapp
  ];
}
