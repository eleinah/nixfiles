{ config, pkgs, ... }:

{
  imports = [
    ./firefox.nix
    ./git.nix
    ./kitty.nix
    ./niriswitcher.nix
    ./starship.nix
    ./zsh.nix
    ./waybar.nix
  ];
}
