{ config, pkgs, ... }:

{
  imports = [
    ./archives.nix
    ./audio.nix
    ./editors.nix
    ./gaming.nix
    ./GNU.nix
    ./langs.nix
    ./networking.nix
    ./nix.nix
    ./stateVersion.nix
    ./syscall.nix
    ./systools.nix
    ./uncategorized.nix
    ./utilities.nix
    ./yubikey.nix
  ];
}
