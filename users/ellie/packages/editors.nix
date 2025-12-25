{ config, pkgs, ... }:

{
  packages = with pkgs; [
    emacs
    neovim
  ];
}
