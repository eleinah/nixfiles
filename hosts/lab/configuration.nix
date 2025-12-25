{ config, lib, pkgs, ... }:

{
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

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.ellie = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
    shell = pkgs.zsh;
    openssh.authorizedKeys.keys = [
        "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQD2M/FCDrMBjERs4nwyXFuNxYMnBwA3fWvb5WiGhkzJdKLv1lBG9VHFOjTGssWhd+y2Y48VgjwmPjg37MxbVEa90wPydGgLzwg69OxyXaJ5D+wXXm0JAHhvhDec3hYN9LXXUDrnFJ7oM5huc5kaAWAdIR0XvETuE1H/Si2IRtSdnh2wvWAEPv16GQ+L95lnpEEhStyy2DqEjrChIvaqXbdHORlxC31whLw3OXmZMOi//PicPgH3oqW+N7UPdbLt0B5L/85nNsPE+/hEBag4yps3EyRApTKWt9v88q3CfiZRY/jIrp/Y4nwJ5DdajFJ6cPyovwWN5M/mwIj7RnvLqmjouwWwP7VMrXd3PEf0v5/Ixj+9Fi+TmLLqeKYG5nxhDfGw0Uywmf7ftpZtSbGdpITNIZJY79be8857d5JC41mIA/hXc7FuRn11yqJc73IjmUp9uqM2EGp+nAQ4LjEHuBPq+d7DQqBi1bsgU54yOzFWdwHa6IYhHWQOjKNuXpdpd6XOyyoXfxi6R693/e1t0FMGmB8ITOGl2WqDSgcXl2QDAYMB0ITcwW006saNR08zFn5KmXT0JhgTDECQwvdNetqA9HFN7eckBecmmni2h40GK5DwsSfPcXMBIwTjI8mHv0bnmi5mV1osJM7sJWCydkyKrOmzbQmVjHl6ZxiHBwzcmw== openpgp:0x161BB29F"
    ];
  };

}
