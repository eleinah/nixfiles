{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    loginExtra = ''
      if [[ -z "$WAYLAND_DISPLAY" && -n "$XDG_VTNR" && "$XDG_VTNR" -eq 1 ]]; then
          exec niri-session
      fi
    '';
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
      mv = "mv -iv";
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
      gh = "$HOME/workspace/github.com/eleinah";
      nixfiles = "$HOME/workspace/github.com/eleinah/nixfiles";
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
}
