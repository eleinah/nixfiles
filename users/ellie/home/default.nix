{ config, pkgs, ... }:

{
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
      source = ./doom;
      recursive = true;
      executable = true;
    };
    
  };
}
