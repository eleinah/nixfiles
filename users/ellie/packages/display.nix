{ config, pkgs, inputs, ... }:

{
  home.packages = with pkgs; [
    fuzzel
    mako
    xdg-desktop-portal-gtk
    xdg-desktop-portal-gnome
    swaybg
    swayidle
    swaylock
    xwayland-satellite
    udiskie
    inputs.caelestia-shell.packages."${pkgs.stdenv.hostPlatform.system}".default
  ];
}
