{ config, pkgs, ... }:

{
  imports = [
    ./archives.nix
    ./audio.nix
    ./display.nix
    ./editors.nix
    ./gaming.nix
    ./GNU.nix
    ./langs.nix
    ./networking.nix
    ./nix.nix
    ./scripts.nix
    ./stateVersion.nix
    ./syscall.nix
    ./systools.nix
    ./uncategorized.nix
    ./utilities.nix
    ./yubikey.nix
  ];
}
