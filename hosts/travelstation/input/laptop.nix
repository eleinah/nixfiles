{ config, pkgs, ... }:

{
  services.libinput = {
    enable = false;
  };
}
