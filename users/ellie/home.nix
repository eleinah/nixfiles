{ config, pkgs, ... }:

{
  home = {
    username = "ellie";
    homeDirectory = "/home/ellie";

    file = {
      "starship.toml" = {
        source = ./dots/.config/starship.toml;
      };
      ".config/scripts" = {
        source = ./dots/.config/scripts;
        recursive = true;
        executable = true;
      };
    };

    packages = with pkgs; [
      fastfetch
      nnn # terminal file manager
      vlc
      zsh-autocomplete

      # langs
      d2
      shellcheck

      # editors
      emacs
      neovim

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
        export EDITOR="emacsclient -c -a 'emacs'"
        export TERM="kitty"
        export BROWSER="firefox"
      '';
      initContent = ''
        zmodload zsh/complist
        autoload -U compinit && compinit
        autoload -U colors && colors

        zstyle ':completion:*' menu select # tab opens cmp menu
        zstyle ':completion:*' special-dirs true # force . and .. to show in cmp menu
        zstyle ':completion:*' squeeze-slashes false # explicit disable to allow /*/ expansion
        zstyle ':completion:*:(ssh|scp):*' remote-access no

        export GPG_TTY=$(tty)
        gpg-connect-agent updatestartuptty /bye >/dev/null

        eval "$(starship init zsh)"
      '';
      shellAliases = {
        v = "nvim";
        e = "emacsclient -nw";
        l = "lsd -lh --color=auto --group-directories-first";
        ls = "lsd -h --color=auto --group-directories-first";
        la = "lsd -lah --color=auto --group-directories-first";
        lt = "lsd -a --color=auto --group-directories-first --tree";
        grep = "grep --color=auto";
        shell = "exec $SHELL -l";
        fk = "sudo !!";
        mv = "mv -i";
        rm = "rm -Iv";
        df = "df -h";
        du = "du -h -d 1";
        wthr = "curl wttr.in";
        ff = "fastfetch";
        view = "viu -a";
      };
      sessionVariables = {
        GIT_EDITOR = "emacsclient -c -a 'emacs'";
        ws = "$HOME/workspace";
        gh = "$ws/github.com/eleinah";
      };
      setOptions = [
        "APPEND_HISTORY"
        "INC_APPEND_HISTORY"
        "SHARE_HISTORY"
        "AUTO_MENU"
        "MENU_COMPLETE"
        "AUTOCD"
        "AUTO_PARAM_SLASH"
        "NO_CASE_GLOB"
        "NO_CASE_MATCH"
        "GLOBDOTS"
        "EXTENDED_GLOB"
        "INTERACTIVE_COMMENTS"
      ];
    };

    firefox = {
      enable = true;
    };

  };
}
