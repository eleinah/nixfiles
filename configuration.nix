{ config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_latest;

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

  # time zone
  time.timeZone = "America/Chicago";

  # Configure keymap in X11
  # services.xserver.xkb.layout = "us";
  # services.xserver.xkb.options = "eurosign:e,caps:escape";

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  services.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.ellie = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
    packages = with pkgs; [
      tree
    ];
    openssh.authorizedKeys.keys = [
        "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQD2M/FCDrMBjERs4nwyXFuNxYMnBwA3fWvb5WiGhkzJdKLv1lBG9VHFOjTGssWhd+y2Y48VgjwmPjg37MxbVEa90wPydGgLzwg69OxyXaJ5D+wXXm0JAHhvhDec3hYN9LXXUDrnFJ7oM5huc5kaAWAdIR0XvETuE1H/Si2IRtSdnh2wvWAEPv16GQ+L95lnpEEhStyy2DqEjrChIvaqXbdHORlxC31whLw3OXmZMOi//PicPgH3oqW+N7UPdbLt0B5L/85nNsPE+/hEBag4yps3EyRApTKWt9v88q3CfiZRY/jIrp/Y4nwJ5DdajFJ6cPyovwWN5M/mwIj7RnvLqmjouwWwP7VMrXd3PEf0v5/Ixj+9Fi+TmLLqeKYG5nxhDfGw0Uywmf7ftpZtSbGdpITNIZJY79be8857d5JC41mIA/hXc7FuRn11yqJc73IjmUp9uqM2EGp+nAQ4LjEHuBPq+d7DQqBi1bsgU54yOzFWdwHa6IYhHWQOjKNuXpdpd6XOyyoXfxi6R693/e1t0FMGmB8ITOGl2WqDSgcXl2QDAYMB0ITcwW006saNR08zFn5KmXT0JhgTDECQwvdNetqA9HFN7eckBecmmni2h40GK5DwsSfPcXMBIwTjI8mHv0bnmi5mV1osJM7sJWCydkyKrOmzbQmVjHl6ZxiHBwzcmw== openpgp:0x161BB29F"
    ];
  };

  programs.firefox.enable = true;

  # Enable Flakes and the new nix CLI tool
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # List packages installed in system profile.
  # You can use https://search.nixos.org/ to find more packages (and options).
  environment.systemPackages = with pkgs; [
    vim
    wget
    dysk
    ripgrep
    unzip
    zip
    fd
    fastfetch
  ];

  environment.variables = {
    EDITOR = "vim";
  };

  programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  # Enable the OpenSSH daemon.
  services.openssh = {
    enable = true;
    settings = {
      X11Forwarding = true;
      PermitRootLogin = "no";
      PasswordAuthentication = false;
    };
    openFirewall = true;
  };

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "25.11"; # Did you read the comment?

}
