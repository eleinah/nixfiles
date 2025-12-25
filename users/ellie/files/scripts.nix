{ config, pkgs, ... }:

{
  file = {
    "scripts" = {
        source = ../home/scripts;
        recursive = true;
        executable = true;
      };
  };
}
