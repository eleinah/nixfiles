{ config, pkgs, ... }:

{
  imports = [
    ./caelestia.nix
    ./doom-emacs.nix
    ./firefox.nix
    ./git.nix
    ./kitty.nix
    ./niriswitcher.nix
    ./starship.nix
    ./zsh.nix
  ];
}
