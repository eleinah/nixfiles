{ config, pkgs, ... }:

{
  home = {
    username = "ellie";
    homeDirectory = "/home/ellie";

    packages = with pkgs; [
      fastfetch
      nnn # terminal file manager
      vlc

      # langs
      d2
      shellcheck

      # editors
      emacs
      vim

      # audio
      kew

      # gaming
      gamescope
      prismlauncher

      # archives
      zip
      unzip
      xz
      p7zip

      # utilities
      ripgrep
      jq
      fzf
      fd
      wget
      bottom
      dysk
      lsd
      freerdp
      flameshot
      viu
      vhs

      # networking
      mtr
      dnsutils
      aria2
      nmap
      ipcalc
      tcpdump

      # GNU
      file
      which
      tree
      gnupg
      gawk

      # yubikey
      yubico-pam
      yubikey-manager

      # vcs
      github-cli

      # nix specific
      nix-output-monitor

      # syscall monitoring
      strace
      ltrace
      lsof

      # systools
      sysstat
      lm_sensors
      ethtool
      pciutils
      usbutils
    ];

    stateVersion = "25.11";
  };

  programs = {

    git = {
      enable = true;
      settings = {
        user = {
          name = "Eleina Mironia";
          email = "eleina@member.fsf.org";
          signingkey = "6339A81D6B416E97";
        };
        init = {
          defaultBranch = "main";
        };
        commit = {
          gpgsign = true;
        };
      };
    };

    starship = {
      enable = true;
    };

    kitty = {
      enable = true;
    };

    zsh = {
      enable = true;
      enableCompletion = true;
      profileExtra = ''
        if [ -f "${./.zprofile}" ]; then
          source "${./.zprofile}"
        fi
      '';
      initContent = ''
        if [ -f "${./.zshrc}" ]; then
          source "${./.zshrc}"
        fi
      '';
    };

    firefox = {
      enable = true;
    };

  };
}
