{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    fuzzel
    xdg-desktop-portal-gtk
    xdg-desktop-portal-gnome
    xwayland-satellite
    udiskie
  ];
}
