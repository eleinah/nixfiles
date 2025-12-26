{ config, pkgs, ... }:

let
  doomSrc = pkgs.fetchFromGitHub {
    owner = "doomemacs";
    repo = "doomemacs";
    rev = "v2.0.9";
    sha256 = "sha256-foiHHP85kZz4UwR8RfmB11xLoC+NbNdQ+sA2YJd/HqQ=";
    fetchSubmodules = true;
  };
in {
  home.file = {

    ".config" = {
      source = ./dots/.config;
      recursive = true;
    };

    "scripts" = {
      source = ./scripts;
      recursive = true;
      executable = true;
    };

    ".ssh/config" = {
      source = ./dots/.ssh/config;
    };

    ".doom.d" = {
      source = ./dots/.doom.d;
    };

    ".emacs.d" = {
      source = doomSrc;
      recursive = true;
      executable = true;
    };
    
  };
}
