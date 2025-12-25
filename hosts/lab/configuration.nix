{ config, lib, pkgs, ... }:

{
  imports = [
    ./users
    ./hardware-configuration.nix
  ];
  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;


  ## Networking stuff

  networking = {
    hostName = "nix-lab";
    networkmanager = {
      enable = true;
      ensureProfiles.profiles = {
        "Wired connection 1" = {
          connection = {
            id = "Wired connection 1";
            type = "802-3-ethernet";
          };
          ipv4 = {
            method = "auto";
            dns = "10.4.10.5";
            dns-search = "lly.local";
          };
        };
      };
    };
  };


  # Enable sound.
  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  services.libinput.enable = false;
}
