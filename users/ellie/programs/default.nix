{ config, pkgs, ... }:

{
  imports = [
    ./caelestia.nix
    ./firefox.nix
    ./git.nix
    ./kitty.nix
    ./niriswitcher.nix
    ./starship.nix
    ./zsh.nix
  ];
}
