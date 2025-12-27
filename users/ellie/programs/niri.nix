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

  systemd.user.servicies.niri-flake-polkit.enable = false;
}
