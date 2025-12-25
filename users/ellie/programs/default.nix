{ config, pkgs, ... }:

{
  imports = [
    ./firefox.nix
    ./git.nix
    ./kitty.nix
    ./starship.nix
    ./zsh.nix
    ./steam.nix
  ];
}
