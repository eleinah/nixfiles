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
    
  };
}
