{
  config,
  lib,
  pkgs,
  ...
}:

{
  programs.niri = {
    enable = true;
  };

  systemd.user.services.niri-flake-polkit.enable = false;
}
