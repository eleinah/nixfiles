{ config, pkgs, ... }:

{
  imports = [
    ./dms.nix
    ./doom-emacs.nix
    ./firefox.nix
    ./git.nix
    ./kitty.nix
    ./niriswitcher.nix
    ./starship.nix
    ./zsh.nix
  ];
}
