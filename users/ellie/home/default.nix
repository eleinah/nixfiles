{ config, pkgs, ... }:

let
  doomSrc = pkgs.fetchFromGitHub {
    owner = "doomemacs";
    repo = "doomemacs";
    rev = "master";
    sha256 = pkgs.lib.fakeSha256;
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
