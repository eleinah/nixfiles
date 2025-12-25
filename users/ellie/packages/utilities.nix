{ config, pkgs, ... }:

{
  packages = with pkgs; [
    ripgrep
    jq
    fzf
    fd
    wget
    bottom
    dysk
    lsd
    freerdp
    flameshot
    viu
    vhs
  ];
}
