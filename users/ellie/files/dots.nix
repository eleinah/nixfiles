{ config, pkgs, ... }:

{
  home.file = {
    ".config" = {
        source = ../home/dots/.config;
        recursive = true;
      };
  };
}
