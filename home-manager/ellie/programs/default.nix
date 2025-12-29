{ config, pkgs, ... }:

{
  imports = [
    ./doom-emacs.nix
    ./firefox.nix
    ./git.nix
    ./gpg.nix
    ./kitty.nix
    ./starship.nix
    ./zsh.nix
  ];
}
